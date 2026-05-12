#!/bin/bash
# Maison Izem — one-time cleanup: move all flat files at Drive 03-Products/ root
# into the correct web/{category}/ subfolders. Idempotent: safe to re-run.

set -euo pipefail

DRIVE_PRODUCTS="$HOME/Library/CloudStorage/GoogleDrive-ryanaoufal@gmail.com/My Drive/Maison Izem/03-Products"
LOCAL_REPO="$HOME/atlas-dark"

# shellcheck source=./categorize.sh
source "$LOCAL_REPO/scripts/categorize.sh"

if [[ ! -d "$DRIVE_PRODUCTS" ]]; then
  echo "ERROR: $DRIVE_PRODUCTS missing"
  exit 1
fi

moved=0
left_alone=0
uncategorized=0

shopt -s nullglob
for f in "$DRIVE_PRODUCTS"/*; do
  # Skip directories (web/, raw/)
  [[ -d "$f" ]] && continue

  base="$(basename "$f")"
  cat="$(categorize "$base")"
  dest_dir="$DRIVE_PRODUCTS/web/$cat"

  if [[ "$cat" == "uncategorized" ]]; then
    echo "  UNCATEGORIZED: $base (leaving in place)"
    uncategorized=$((uncategorized+1))
    continue
  fi

  mkdir -p "$dest_dir"
  dest="$dest_dir/$base"

  if [[ -f "$dest" ]]; then
    # Already at destination — remove the flat duplicate.
    rm "$f"
    left_alone=$((left_alone+1))
  else
    # Move to subfolder.
    mv "$f" "$dest"
    moved=$((moved+1))
  fi
done

echo
echo "[cleanup-drive-products]"
echo "  Moved into web/{category}/:  $moved"
echo "  Removed (already in dest):   $left_alone"
echo "  Left at root (uncategorized): $uncategorized"
