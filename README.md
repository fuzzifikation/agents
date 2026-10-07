# agents

A home for agents and working rules that were developed while working *with* AI, on real code, under real damage. No toys.

## Contents

| Path | What it is |
|---|---|
| [`working-principles.instructions.md`](working-principles.instructions.md) | How an AI partner must operate on this owner's repos: git/push discipline, version and release law, changelog epistemology, review governance, verification laws, simplicity laws. Project-agnostic by design. |
| [`text-style.instructions.md`](text-style.instructions.md) | Prose law for anything a human reads: fluff kill criteria, marked-repetition protocol, sentence architecture, naming discipline, audit greps, sources. Globbed to prose files so it stays out of pure-code sessions. |
| [`structural-review.agent.md`](structural-review.agent.md) | Language-agnostic structural reviewer agent: minimal-graph goal, rent/placement/wiring lenses, deterministic tooling. Read-only, never edits. |
| [`structural-review-assets/`](structural-review-assets/) | The agent's cached tooling (`extract-ts.mjs`, `analyze.mjs`) — same layout as inside a consumer repo, so the agent's relative asset path works in both homes. |
| [`bin/sync.sh`](bin/sync.sh), [`bin/sync.ps1`](bin/sync.ps1) | Vendoring sync. Copy this repo's files into another repo (or your VS Code user profile). Windows + Linux/WSL. |

## The model: vendor, don't link

This repo is **upstream law**. Consumer repos hold **stamped copies**, never live links. No submodules, no subtree, no package — vendoring is one dumb file copy plus a provenance stamp, and it works identically on Windows, WSL, and an SSH'd box, because after the copy there is nothing left to resolve.

Two rules make it safe:

1. **Never edit a vendored copy.** It carries a stamp naming its upstream commit. Fix the law upstream, then re-sync every repo that rides it.
2. **Keep the two halves separated.** `working-principles.instructions.md` and `text-style.instructions.md` stay project-agnostic; project-specific law (architecture, build commands, standing rulings) lives in that repo's own `copilot-instructions.md`, and a domain overlay (typeset-mathematics prose rules, say) lives in that project's own file. If field experience in a project improves the general law, the improvement moves upstream by hand.

## Usage

Clone once, then run from that clone in any repo:

```sh
git clone https://github.com/fuzzifikation/agents.git ~/agents

# vendor the working principles into a repo (default: .github/instructions/)
~/agents/bin/sync.sh /path/to/repo

# also drop the structural-review agent + assets into that repo
~/agents/bin/sync.sh --agents /path/to/repo
```

Windows (PowerShell), same thing:

```powershell
git clone https://github.com/fuzzifikation/agents.git $HOME\agents
& $HOME\agents\bin\sync.ps1 C:\path\to\repo
& $HOME\agents\bin\sync.ps1 -Agents C:\path\to\repo
```

Update a repo later: pull the clone (`git -C ~/agents pull --ff-only`) and re-run `sync`. It overwrites the vendored files wholesale and prints old → new stamp, so drift is visible by reading the file, not by archaeology. The script performs **no network and no git operations on the clone** — you decide when upstream is fresh.

### Repo scope vs user scope

| Scope | Target | Use when |
|---|---|---|
| **Repo** (default) | `<repo>/.github/instructions/`, `<repo>/.github/agents/` | The repo is opened locally, in WSL, or over SSH — workspace customizations are read from the workspace host, so a file in the repo is always found. **This is the portable path.** |
| **User** (`--user`) | VS Code user profile prompts folder | You want the law in every window on one machine, including throwaway dirs. |

User-profile locations: Windows `%APPDATA%\Code\User\prompts`; Linux/WSL `~/.config/Code/User/prompts` (override with `VSCODE_USER_PROMPTS`).

**On WSL and SSH boxes, prefer repo scope.** Workspace `.github/` files live on the filesystem that hosts the workspace, which is also where the vLLM/endpoint and the terminal are — so a vendored file behaves the same everywhere. A user-profile install is per-machine (and per-profile) and belongs to whichever side VS Code resolves it from: fine on your workstation, annoying to keep true on a fleet.

`sync` also warns when the target repo has a `copilot-instructions.md` with no pointer to the vendored file. Keep one line there — it costs nothing and guarantees a session discovers the rules even when always-apply semantics differ between VS Code versions.

### Requirements

`sh` + `git` on POSIX, PowerShell on Windows. The *agent's* tooling needs Node.js on the machine that runs the review; on a bare box without it, the agent is required to say so rather than fake a run.
