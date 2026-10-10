---
name: vscode-extension
description: "Field-tested law for VS Code extensions: Disposable lifecycle, proposal-gating reality, webview handshake and CSP, ignored menu arguments, packaging and VSIX facts, extension-host testing without Selenium. Applies when a repo ships a VS Code extension."
applyTo: "**"
---

# VS Code Extension Law

Every rule below was verified against a real editor or a real VSIX, not against documentation. The source of truth for API behavior is the installed `node_modules/@types/vscode/index.d.ts`: doc tools and training data return proposal-era text long after graduation. Dates mark when a fact was last verified against source; re-verify anything version-sensitive (WP8) before shipping on it.

## 1 Lifecycle

1. **Everything that allocates a resource is `Disposable`:** timers, event listeners, output channels, registered providers. Dispose in `dispose()`, push to `context.subscriptions` in `activate()`. An undisposed `EventEmitter` keeps firing after teardown; `dispose()` cancels firing and clears listeners.
2. **Respect cancellation.** Check `token.isCancellationRequested` inside loops and pass an `AbortSignal` to `fetch`. A provider that ignores cancellation holds the host hostage.
3. **React to `onDidChangeConfiguration` with cache invalidation.** Requiring a window reload to pick up a setting is a defect, and a second cache outside the owner is a stale-read bug waiting its turn.
4. **A `TreeItem` without a stable `id` loses its expanded state on every tree refresh** (the re-render treats it as new). Any collapsible node in a poll-refreshed tree must set `id`.

## 2 API surface (verified against VS Code 1.137–1.140 source, 2026)

5. **`enabledApiProposals` grants nothing on stable and costs errors on production installs:** VS Code logs a `CANNOT USE these API proposals` error in every window where the declaration is not allowlisted. Ship without the declaration and feature-detect the proposal-era type; declare it only while testing in an F5 dev host, remove before packaging.
6. **A provider that throws during model resolve is a self-immolation.** It surfaces as one passive vendor-group status line inside the model picker (never a popup) and hides every row of that vendor. Catch per-item failures yourself.
7. **The model picker does not re-query providers when opened.** It renders the editor's cache; only the provider's change event re-renders it. Info callbacks run on activation, on the picker's select command, and on provider change events.
8. **Modal message text is inert.** `showInformationMessage` renders no markdown, no clickable links, no text selection; buttons are the only interaction. Non-modal notifications do linkify plain URLs. Buttons render in argument order (macOS: top-down), first is the default; icons require `MessageItem` objects, not strings; ✕/Escape return `undefined` unless an item is marked `isCloseAffordance: true`.
9. **`InputBox.validateInput` must return `undefined`, never `null`** (`null` is a type error in current dts).
10. **Static `arguments` in `view/item/context` menu contributions do not reach the command:** silent no-op with `undefined` args. Encode variants in separate command identities.
11. **Menu-contribution `title` overrides in `view/item/context` are ignored** (VS Code 1.128, tested). The `contributes.commands` title is the only source of a tree context-menu label.
12. **`extensionKind` decides where your request code runs.** `["workspace"]` keeps it beside the workspace host, so `localhost` means the machine holding the endpoint. Remote windows make this a correctness decision, not a preference.

## 3 Webviews

13. **Never put an inline `<script>` inside a template literal.** The closing `</script>` tag terminates the block regardless of escaping. Load separate `.js` files via `webview.asWebviewUri()`, with `localResourceRoots` set to the actual asset directory.
14. **Use a ready handshake.** The webview installs its message listener, then posts `ready`; only then does the extension send initial state. Posting right after assigning `webview.html` races and loses the payload.
15. **Start from a restrictive CSP:** `default-src 'none'; style-src ${cspSource}; script-src ${cspSource};`. Keep `script-src` free of `unsafe-inline` and `unsafe-eval` forever; a `style-src 'unsafe-inline'` exception is a documented trade, not a default.
16. **Webview JS ships untyped.** Resources in `resources/` never see the TypeScript compiler: validate with `node --check resources/*.js` in the build. Classic traps: `el?.onclick = fn` is a parse error (optional chaining cannot be an assignment target), `ontoggle` not `onToggle`.
17. **Debug a blank or dead webview with `Developer: Open Webview Developer Tools`** and read the webview console before restructuring the architecture.

## 4 Packaging (verified against real vsce runs, 2026-09)

18. **A root `LICENSE` file is always auto-packed** into the VSIX as `extension/LICENSE.txt`, even with no `license` field in the manifest. It can be excluded via `.vscodeignore` with no warning. The Marketplace license property reads the manifest `license` (SPDX) and does not have to match the repo's license text. vsce has no license-path flag (only `--skip-license`), so a staged build directory is the only clean lever when repo license and shipped license differ (see gotcha 23 upstream).
19. **`vsce package <arg>`: the positional argument is a version bump, not an output directory.** vsce operates on cwd and runs `vscode:prepublish` if defined.
20. **`.vscodeignore` is the only thing that decides what ships,** so derive staging by copying the tree, never from a hand-written payload list; and let a packaging test assert expected presence, not just forbidden names (gotchas 22 upstream).

## 5 Extension-host testing (field-verified 2026-10)

21. **You do not need Selenium to drive your own UI.** Test files run in the same extension host as the extension, so assigning over `vscode.window.showInputBox` / `showQuickPick` / `showInformationMessage` intercepts the extension's own dialog calls. Script answers by dialog title, not call order (flows fire-and-forget void toasts), and run scripted values through the flow's own `validateInput`. `executeCommand` on a contributed command activates the extension like a palette keystroke.
22. **`@vscode/test-cli` defaults mocha to the `tdd` ui:** a bdd suite dies with "describe is not defined" and reads like an ESM loader bug. The config must state `mocha: { ui: 'bdd' }`.
23. **`@vscode/test-cli` requires `@vscode/test-electron` as a direct devDependency** of the repo, or enhanced-resolve dies at repo root.
24. **Manifest fields survive the harness's own packaging verbatim.** "Depends on unknown extension X" means the manifest really lists X in `extensionDependencies`.
25. **`LanguageModelChat.sendRequest()`'s promise settles only when the provider response completes.** Arm cancellation from outside the await (timer or parallel task), never from inside the drain loop, or the test hangs until the token budget of the universe expires.
26. **API-surface events activate extensions:** `vscode.lm.selectChatModels({ vendor })` activates a matching provider through the manifest event with no sign-in and no user selection. Dev-path `globalStorage` lives under the harness's user-data dir, so tests can plant files there to drive timer-based code paths.
