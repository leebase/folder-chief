#!/usr/bin/env bash
set -euo pipefail

# setup-sqlite-mem.sh
# Downloads and installs the sqlite-mem binary for folder-chief.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
BIN_DIR="$ROOT_DIR/bin"
TARGET_BIN="$BIN_DIR/sqlite-mem"

VERSION="${SQLITE_MEM_VERSION:-v1.0.0}"
FORCE=false
OVERRIDE_TARGET=""

usage() {
  cat <<USAGE_EOF
Usage: $(basename "$0") [options] [target]

Downloads and installs the sqlite-mem binary release into bin/sqlite-mem.

Options:
  -f, --force               Re-download and overwrite existing binary
  -p, --platform, --target  Target platform override
  -h, --help                Show this help message

Target options:
  linux-x86_64-musl
  linux-aarch64-musl
  macos-aarch64
  macos-x86_64
  windows-x86_64

Examples:
  $(basename "$0")
  $(basename "$0") --force
  $(basename "$0") linux-x86_64-musl
  $(basename "$0") --platform macos-aarch64
USAGE_EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    -f|--force)
      FORCE=true
      shift
      ;;
    -p|--platform|--target)
      if [[ $# -lt 2 ]]; then
        echo "Error: $1 requires an argument" >&2
        exit 1
      fi
      OVERRIDE_TARGET="$2"
      shift 2
      ;;
    --platform=*|--target=*)
      OVERRIDE_TARGET="${1#*=}"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      echo "Error: Unknown option $1" >&2
      usage >&2
      exit 1
      ;;
    *)
      if [[ -z "$OVERRIDE_TARGET" ]]; then
        OVERRIDE_TARGET="$1"
      else
        echo "Error: Multiple targets specified: '$OVERRIDE_TARGET' and '$1'" >&2
        exit 1
      fi
      shift
      ;;
  esac
done

# If already installed and operational, exit cleanly unless --force
if [[ "$FORCE" != "true" ]] && [[ -f "$TARGET_BIN" ]]; then
  chmod +x "$TARGET_BIN" 2>/dev/null || true
  if version_out="$("$TARGET_BIN" --version 2>/dev/null)"; then
    echo "sqlite-mem is already installed and operational ($version_out) at $TARGET_BIN"
    echo "Use --force to re-download."
    exit 0
  fi
fi

map_target() {
  local target="$1"
  case "$target" in
    linux-x86_64-musl|sqlite-mem-linux-x86_64-musl.zip)
      echo "sqlite-mem-linux-x86_64-musl.zip"
      ;;
    linux-x86_64|linux-amd64)
      echo "sqlite-mem-linux-x86_64-musl.zip"
      ;;
    linux-aarch64-musl|sqlite-mem-linux-aarch64-musl.zip)
      echo "sqlite-mem-linux-aarch64-musl.zip"
      ;;
    linux-aarch64|linux-arm64)
      echo "sqlite-mem-linux-aarch64-musl.zip"
      ;;
    macos-aarch64|sqlite-mem-macos-aarch64.zip|darwin-arm64|darwin-aarch64|macos-arm64)
      echo "sqlite-mem-macos-aarch64.zip"
      ;;
    macos-x86_64|sqlite-mem-macos-x86_64.zip|darwin-x86_64)
      echo "sqlite-mem-macos-x86_64.zip"
      ;;
    windows-x86_64|sqlite-mem-windows-x86_64.zip|windows-amd64)
      echo "sqlite-mem-windows-x86_64.zip"
      ;;
    *)
      if [[ "$target" == sqlite-mem-*.zip ]]; then
        echo "$target"
      elif [[ "$target" == *.zip ]]; then
        echo "$target"
      else
        echo "sqlite-mem-${target}.zip"
      fi
      ;;
  esac
}

detect_host_target() {
  local os arch
  os="$(uname -s)"
  arch="$(uname -m)"

  case "$os" in
    Linux)
      case "$arch" in
        x86_64|amd64)
          echo "sqlite-mem-linux-x86_64-musl.zip"
          ;;
        aarch64|arm64)
          echo "sqlite-mem-linux-aarch64-musl.zip"
          ;;
        *)
          echo "Error: Unsupported Linux architecture: $arch" >&2
          return 1
          ;;
      esac
      ;;
    Darwin)
      case "$arch" in
        arm64|aarch64)
          echo "sqlite-mem-macos-aarch64.zip"
          ;;
        x86_64)
          echo "sqlite-mem-macos-x86_64.zip"
          ;;
        *)
          echo "Error: Unsupported Darwin architecture: $arch" >&2
          return 1
          ;;
      esac
      ;;
    CYGWIN*|MINGW*|MSYS*|Windows_NT)
      case "$arch" in
        x86_64|amd64)
          echo "sqlite-mem-windows-x86_64.zip"
          ;;
        *)
          echo "Error: Unsupported Windows architecture: $arch" >&2
          return 1
          ;;
      esac
      ;;
    *)
      echo "Error: Unsupported OS: $os" >&2
      return 1
      ;;
  esac
}

if [[ -n "$OVERRIDE_TARGET" ]]; then
  ASSET_NAME="$(map_target "$OVERRIDE_TARGET")"
else
  ASSET_NAME="$(detect_host_target)"
fi

DOWNLOAD_URL="https://github.com/leebase/sqlite-mem/releases/download/${VERSION}/${ASSET_NAME}"

TMP_DIR="$(mktemp -d -t sqlite-mem-setup.XXXXXX)"
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

ARCHIVE_PATH="$TMP_DIR/$ASSET_NAME"
echo "Downloading $ASSET_NAME from $DOWNLOAD_URL..."
if ! curl -fsSL "$DOWNLOAD_URL" -o "$ARCHIVE_PATH"; then
  echo "Error: Failed to download $DOWNLOAD_URL" >&2
  exit 1
fi

echo "Extracting $ASSET_NAME..."
EXTRACT_DIR="$TMP_DIR/extracted"
mkdir -p "$EXTRACT_DIR"

if command -v unzip >/dev/null 2>&1; then
  unzip -q -o "$ARCHIVE_PATH" -d "$EXTRACT_DIR"
elif command -v python3 >/dev/null 2>&1; then
  python3 -m zipfile -e "$ARCHIVE_PATH" "$EXTRACT_DIR"
else
  echo "Error: Neither unzip nor python3 is available to extract zip archive." >&2
  exit 1
fi

mkdir -p "$BIN_DIR"

if [[ -f "$EXTRACT_DIR/sqlite-mem" ]]; then
  mv "$EXTRACT_DIR/sqlite-mem" "$TARGET_BIN"
elif [[ -f "$EXTRACT_DIR/sqlite-mem.exe" ]]; then
  mv "$EXTRACT_DIR/sqlite-mem.exe" "$TARGET_BIN"
else
  echo "Error: sqlite-mem binary not found in archive $ASSET_NAME" >&2
  exit 1
fi

chmod +x "$TARGET_BIN"

echo "Verifying installation..."
if version_out="$("$TARGET_BIN" --version 2>&1)"; then
  if [[ "$version_out" == *"1.0.0"* ]]; then
    echo "sqlite-mem installed successfully at $TARGET_BIN ($version_out)"
  else
    echo "Error: Installed sqlite-mem reported unexpected version output: $version_out" >&2
    exit 1
  fi
else
  if [[ -n "$OVERRIDE_TARGET" ]]; then
    echo "Installed $ASSET_NAME to $TARGET_BIN (binary could not be executed on host $(uname -s)/$(uname -m), likely cross-platform target)."
  else
    echo "Error: Failed to execute $TARGET_BIN: $version_out" >&2
    exit 1
  fi
fi
