#!/bin/bash
# Maison Izem — pull Drive product files into the local repo (flattens categorized → flat).
# Use when the fleet has added new files to Drive 03-Products/web/{category}/
# and you want to commit them to the live site.
# Source of truth for the site is local /media/products/; this brings Drive additions in.

set -euo pipefail

LOCAL_PRODUCTS="$HOME/atlas-dark/media/products"
DRIVE_PRODUCTS="$HOME/Library/CloudStorage/GoogleDrive-ryanaoufal@gmail.com/My Drive/Maison Izem/03-Products/web"

if [[ ! -d "$DRIVE_PRODUCTS" ]]; then
  echo "ERROR: Drive products folder missing"
  exit 1
fi

pulled=0
skipped=0

shopt -s nullglob
for category_dir in "$DRIVE_PRODUCTS"/*/; do
  cat="$(basename "$category_dir")"
  for f in "$category_dir"*; do
    [[ -f "$f" ]] || continue
    base="$(basename "$f")"
    dest="$LOCAL_PRODUCTS/$base"
    if [[ -f "$dest" ]]; then
      skipped=$((skipped+1))
    else
      cp -p "$f" "$dest"
      echo "  pulled: $cat/$base"
      pulled=$((pulled+1))
    fi
  done
done

echo
echo "[pull-from-drive]"
echo "  Pulled into local: $pulled"
echo "  Already present:   $skipped"

if (( pulled > 0 )); then
  echo
  echo "Run 'git add media/products && git commit && git push' to deploy these."
fi
