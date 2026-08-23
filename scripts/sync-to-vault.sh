#!/usr/bin/env bash
# Copies the built theme (manifest.json + theme.css) from this repo into an
# Obsidian vault's .obsidian/themes/Obsidianotion folder, so you can test
# changes without publishing to the community theme store.
#
# Usage:
#   ./scripts/sync-to-vault.sh                 # uses the default vault below
#   ./scripts/sync-to-vault.sh /path/to/vault  # copies into a specific vault

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEFAULT_VAULT="/Users/diegoeis/Documents/obs-notes"
VAULT="${1:-$DEFAULT_VAULT}"

if [ ! -d "$VAULT" ]; then
  echo "Vault not found: $VAULT" >&2
  exit 1
fi

DEST="$VAULT/.obsidian/themes/Obsidianotion"
mkdir -p "$DEST"

cp "$REPO_DIR/manifest.json" "$DEST/manifest.json"
cp "$REPO_DIR/theme.css" "$DEST/theme.css"

echo "Synced theme -> $DEST"
