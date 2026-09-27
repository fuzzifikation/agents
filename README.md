# agents

A home for agents and working rules that were developed while working *with* AI, on real code, under real damage. No toys.

## Contents

| File | What it is | Deploy as |
|---|---|---|
| [`structural-review.agent.md`](structural-review.agent.md) | Language-agnostic structural reviewer agent: minimal-graph goal, rent/placement/wiring lenses, deterministic tooling. Read-only, never edits. Assets cached in [`structural-review-assets/`](structural-review-assets/). | User-level custom agent (`.github/agents/` in your profile, or VS Code user-level agents) |
| [`working-principles.instructions.md`](working-principles.instructions.md) | How an AI partner must operate on this owner's repos: git/push discipline, version and release law, changelog epistemology, review governance, verification laws, simplicity laws. | Copy into a repo as `.github/copilot-instructions.md`, or as a `.instructions.md` file with `applyTo: "**"` frontmatter |

## Deployment

- The instructions file is a **template**: copy it into each repo and append project-specific sections there (architecture, build commands, standing rulings). The file itself stays project-agnostic — that is the whole point.
- The agent is **user-level**: one copy governs every repo; repos keep only their tooling and rulings, never a copy of the agent description.
- Durable facts learned in AI sessions belong in repo-visible docs (the instructions file or a `docs/` file), never only in an assistant's private memory. Memory is a cache; the repo is the disk.
