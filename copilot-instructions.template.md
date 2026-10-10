# [Project Name] AI Assistant Instructions

> **General working rules are vendored, not duplicated here:** see
> `.github/instructions/working-principles.instructions.md` (upstream:
> `fuzzifikation/agents`, re-sync with `bin/sync.ps1` / `bin/sync.sh`). Git/push
> discipline, version and release law, changelog epistemology, review governance,
> verification laws, simplicity laws and communication style live there and apply
> to every repo. Shell and tooling traps: `.github/instructions/tooling-gotchas.instructions.md`.
> **Everything below is this project only.**

<!--
  TEMPLATE: copy to <repo>/.github/copilot-instructions.md, fill every bracket,
  delete this comment and every empty section. A section that has nothing true to
  say stays deleted: an instructions file full of placeholders teaches the model
  to ignore the file. Keep this file to project facts an AI cannot guess:
  commands, architecture decisions, standing rulings, traps. Prose law and
  working law are vendored files: link, never restate them (WP42 order:
  commit upstream, sync, commit here).
-->

## Scope

[One paragraph. What this project is, and the sentence each proposal must pass:
"does it make <this thing> better or keep it working?" Ideas that fail it belong
to another product. A tidy repository that aims at one thing.]

## Commands

- **Build:** [the command that produces the artifact; per WP25 this is the only
  build that matters; name the fast checks (compile, test) and say plainly what
  each of them does NOT verify.]
- **Test:** [command; here, tests exist only as tripwires for named breakage
  (data formats, persistence writes, lifecycle); list which, so nobody re-adds
  ceremony tests.]
- **[Package/deploy]:** [command and its one gotcha, if any.]

## Architecture

[Only decisions and invariants, not a file tour the model can read itself. A
table of module to responsibility earns its place when the repo grows past a
dozen files. Then the invariants that are not visible from the code: who owns
which cache, which seam must stay host-neutral, which import direction is
forbidden and why.]

## Conventions (project only)

[Things that differ from ecosystem defaults: naming, file layout, ESM vs CJS,
license handling, doc placement. One line each, with the reason if the reason
is not obvious.]

## Anti-patterns

[Things this codebase has been burned by. Each line names the shape and the
damage it caused. This section is the highest-value text in the file; it is
where a project pays forward its scars. Example shapes: a probe path that must
never come back, a duplicate cache that caused stale reads, a "workaround"
that was load-bearing and must not be deleted.]

## Standing rulings

[Owner decisions that must not be re-proposed: accepted asymmetries, deliberate
"bad" designs, waived findings. Date each ruling. Per WP21 these stay visible
forever; git history does not hold "we decided this on purpose".]

## Defaults (edit per project)

- **Version support:** support only the newest upstream (runtime, framework,
  host, library). No workarounds for old versions unless the owner asks in
  writing. Override here when the project must support a floor.
- **Secrets:** keys and hostnames never enter tracked files; user settings are
  not part of the codebase. If a key or hostname ever turns up in the repo,
  stop, commit the current work, and tell the owner loudly. Rotation is an
  out-of-band decision, not a silent rewrite.
