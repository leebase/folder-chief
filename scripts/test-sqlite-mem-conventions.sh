#!/usr/bin/env bash
set -euo pipefail

# scripts/test-sqlite-mem-conventions.sh
# Regression guard: ensures no user-facing examples place database option before subcommands
# and optionally verifies live binary probe if bin/sqlite-mem is present.
# Does NOT download binaries, touch the network, or mutate installation state.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "Running sqlite-mem documentation convention checks..."

# 1. Audit user-facing docs and skills for invalid option ordering
# Subcommand options must follow the subcommand (e.g., 'sqlite-mem info --db ...')
SEARCH_PATHS=()
for path in .claude .gemini chief docs README.md CHANGELOG.md scripts AGENTS.md; do
  if [[ -e "$path" ]]; then
    SEARCH_PATHS+=("$path")
  fi
done

PATTERN="sqlite-mem[[:space:]]+--db"
MATCHES=$(grep -rnE "$PATTERN" "${SEARCH_PATHS[@]}" 2>/dev/null | grep -v "test-sqlite-mem-conventions.sh" || true)

if [[ -n "$MATCHES" ]]; then
  echo "FAIL: Found invalid subcommand option ordering in:" >&2
  echo "$MATCHES" >&2
  echo "Subcommand options must follow the subcommand (e.g., 'sqlite-mem info --db ...')" >&2
  exit 1
fi

echo "PASS: No invalid option ordering found in documentation."

# 2. Binary probe check (offline only, if installed)
BIN="./bin/sqlite-mem"
if [[ -x "$BIN" ]]; then
  echo "Found installed binary at $BIN; running non-destructive probes..."
  VERSION_OUT=$("$BIN" --version)
  echo "Binary version: $VERSION_OUT"

  DB_PATH="brain/.sqlite-mem.db"
  if [[ -f "$DB_PATH" ]]; then
    echo "Running probe: $BIN info --db $DB_PATH --verify"
    "$BIN" info --db "$DB_PATH" --verify
    echo "PASS: sqlite-mem info --verify probe succeeded."
  else
    echo "Notice: $DB_PATH not present on disk; probe skipped without mutating state."
  fi
else
  echo "SKIP: $BIN is not installed; skipping binary probe without mutating installation state."
fi

echo "All sqlite-mem convention checks passed successfully."
