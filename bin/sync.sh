#!/bin/sh
# Vendor this repo's AI customizations into another repo (or the VS Code user profile).
# POSIX sh: runs on Linux, WSL, macOS. Windows twin: bin/sync.ps1
#
#   sync.sh [--agents] [--user] <target-repo-path>
#
# Copies are stamped with this clone's commit. No network, no git on the clone:
# you decide when upstream is fresh (git -C <clone> pull --ff-only), then re-run.
set -eu

SRC=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
SHA=$(git -C "$SRC" rev-parse --short HEAD 2>/dev/null || echo unknown)
STAMP="<!-- vendored from fuzzifikation/agents @ $SHA, synced $(date -u +%Y-%m-%d). Do not edit here: edit upstream and re-run bin/sync -->"

usage() { echo "usage: sync.sh [--agents] [--user] <target-repo-path>" >&2; exit 2; }

WITH_AGENTS=0
INTO_USERS=0
TARGET=""
while [ $# -gt 0 ]; do
  case $1 in
    --agents) WITH_AGENTS=1 ;;
    --user)   INTO_USERS=1 ;;
    -h|--help) usage ;;
    -*) usage ;;
    *) [ -z "$TARGET" ] || usage; TARGET=$1 ;;
  esac
  shift
done
[ -n "$TARGET" ] || usage

if [ "$INTO_USERS" -eq 1 ]; then
  DEST=${VSCODE_USER_PROMPTS:-$HOME/.config/Code/User/prompts}
else
  [ -d "$TARGET" ] || { echo "no such directory: $TARGET" >&2; exit 1; }
  DEST="$TARGET/.github"
fi

# Copy one file, inserting the provenance stamp after the YAML frontmatter
# (frontmatter must stay at byte zero or the parser never sees it).
vendor() {
  src=$1; dst=$2
  mkdir -p "$(dirname "$dst")"
  if [ -f "$dst" ]; then
    old=$(grep -m1 -o 'agents @ [^,]*' "$dst" 2>/dev/null || echo "untracked version")
  else
    old="new"
  fi
  tmp="$dst.tmp"
  if [ "$(head -1 "$src")" = "---" ]; then
    awk -v s="$STAMP" '{ print } !stamped && $0 == "---" && ++d == 2 { print ""; print s; stamped = 1 }' "$src" > "$tmp"
  else
    { echo "$STAMP"; echo; cat "$src"; } > "$tmp"
  fi
  mv "$tmp" "$dst"
  echo "  $(basename "$dst"): $old -> @ $SHA"
}

echo "sync -> $DEST"
vendor "$SRC/working-principles.instructions.md" "$DEST/instructions/working-principles.instructions.md"
vendor "$SRC/text-style.instructions.md" "$DEST/instructions/text-style.instructions.md"

if [ "$WITH_AGENTS" -eq 1 ]; then
  vendor "$SRC/structural-review.agent.md" "$DEST/agents/structural-review.agent.md"
  # sibling assets folder: the agent resolves <its-dir>/structural-review-assets/
  rm -rf "$DEST/agents/structural-review-assets"
  mkdir -p "$DEST/agents/structural-review-assets"
  cp "$SRC"/structural-review-assets/*.mjs "$DEST/agents/structural-review-assets/"
  echo "  structural-review-assets/: $(cd "$SRC/structural-review-assets" && ls *.mjs | tr '\n' ' ')"
fi

# Repo scope only: make sure the project file points at the vendored law.
if [ "$INTO_USERS" -eq 0 ] && [ -f "$TARGET/.github/copilot-instructions.md" ]; then
  if ! grep -qi 'working-principles' "$TARGET/.github/copilot-instructions.md"; then
    echo "WARN  $TARGET/.github/copilot-instructions.md has no pointer to working-principles."
    echo "      Add one line so every session finds the general law, e.g.:"
    echo "      > General working rules: vendored from fuzzifikation/agents, see"
    echo "      > .github/instructions/working-principles.instructions.md"
  fi
fi
