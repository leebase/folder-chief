#!/usr/bin/env bash
set -euo pipefail

# scripts/apply-load.sh
# Applies a role load (starter kit) from chief/templates/loads/<load-name>
# to the Folder Chief runtime brain.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

usage() {
  cat <<USAGE_EOF
Usage: $(basename "$0") <load-name>

Applies a role load (starter kit) to the Folder Chief brain.

Arguments:
  <load-name>   Name of the load directory inside chief/templates/loads/

Available loads:
USAGE_EOF
  if [[ -d "$ROOT_DIR/chief/templates/loads" ]]; then
    local found=false
    for dir in "$ROOT_DIR/chief/templates/loads"/*; do
      if [[ -d "$dir" ]]; then
        echo "  - $(basename "$dir")"
        found=true
      fi
    done
    if [[ "$found" = false ]]; then
      echo "  (No loads found)"
    fi
  else
    echo "  (chief/templates/loads/ directory not found)"
  fi
}

# Validate argument presence
if [[ $# -lt 1 || -z "${1:-}" ]]; then
  echo "Error: Missing load name argument." >&2
  echo "" >&2
  usage >&2
  exit 1
fi

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  usage
  exit 0
fi

LOAD_NAME="${1%/}"
LOAD_NAME="$(basename "$LOAD_NAME")"
LOAD_DIR="$ROOT_DIR/chief/templates/loads/$LOAD_NAME"

# Check if chief/templates/loads/$1 exists
if [[ ! -d "$LOAD_DIR" ]]; then
  echo "Error: Load '$LOAD_NAME' does not exist in chief/templates/loads/" >&2
  exit 1
fi

# Ensure target brain directories exist
mkdir -p "$ROOT_DIR/brain/state"
mkdir -p "$ROOT_DIR/brain/inbox"

loaded_me=false
backup_me=false
loaded_today=false
backup_today=false
loaded_inbox=false
inbox_files=()

# 1. Copy me.md to brain/me.md (backup old one if it exists)
if [[ -f "$LOAD_DIR/me.md" ]]; then
  if [[ -f "$ROOT_DIR/brain/me.md" ]]; then
    cp "$ROOT_DIR/brain/me.md" "$ROOT_DIR/brain/me.md.bak"
    backup_me=true
  fi
  cp "$LOAD_DIR/me.md" "$ROOT_DIR/brain/me.md"
  loaded_me=true
fi

# 2. Copy today.md to brain/state/today.md (backup old one if it exists)
if [[ -f "$LOAD_DIR/today.md" ]]; then
  if [[ -f "$ROOT_DIR/brain/state/today.md" ]]; then
    cp "$ROOT_DIR/brain/state/today.md" "$ROOT_DIR/brain/state/today.md.bak"
    backup_today=true
  fi
  cp "$LOAD_DIR/today.md" "$ROOT_DIR/brain/state/today.md"
  loaded_today=true
fi

# 3. If inbox/ exists, copy its contents to brain/inbox/
if [[ -d "$LOAD_DIR/inbox" ]]; then
  while IFS= read -r -d '' file; do
    inbox_files+=("$(basename "$file")")
  done < <(find "$LOAD_DIR/inbox" -mindepth 1 -maxdepth 1 ! -name ".gitkeep" -print0 2>/dev/null || true)

  cp -R "$LOAD_DIR/inbox/." "$ROOT_DIR/brain/inbox/"
  loaded_inbox=true
fi

# Print success summary
echo "✓ Successfully applied role load: $LOAD_NAME"
echo ""
echo "Summary of changes:"
if [[ "$loaded_me" = true ]]; then
  if [[ "$backup_me" = true ]]; then
    echo "  - Profile:   brain/me.md (backed up previous to brain/me.md.bak)"
  else
    echo "  - Profile:   brain/me.md"
  fi
fi

if [[ "$loaded_today" = true ]]; then
  if [[ "$backup_today" = true ]]; then
    echo "  - Today:     brain/state/today.md (backed up previous to brain/state/today.md.bak)"
  else
    echo "  - Today:     brain/state/today.md"
  fi
fi

if [[ "$loaded_inbox" = true ]]; then
  if [[ ${#inbox_files[@]} -gt 0 ]]; then
    echo "  - Inbox:     Copied ${#inbox_files[@]} item(s) to brain/inbox/"
    for f in "${inbox_files[@]}"; do
      echo "               • $f"
    done
  else
    echo "  - Inbox:     brain/inbox/ synchronized"
  fi
fi
