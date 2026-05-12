#!/bin/bash
# Maison Izem — Drive sync (Turbo authoritative local → Drive mirror).
# Local repo `media/products/` is flat (Vercel/Supabase require this).
# Drive `Maison Izem/03-Products/web/{category}/` is auto-categorized so the fleet can navigate by type.
# Hero, lifestyle, archive, manifest, brand docs are 1:1 mirror.

set -euo pipefail

LOCAL_REPO="$HOME/atlas-dark"
LOCAL_MEDIA="$LOCAL_REPO/media"
DRIVE_ROOT="$HOME/Library/CloudStorage/GoogleDrive-ryanaoufal@gmail.com/My Drive/Maison Izem"

if [[ ! -d "$DRIVE_ROOT" ]]; then
  echo "ERROR: Drive mount missing — $DRIVE_ROOT"
  echo "Is Google Drive desktop running and Maison Izem folder created?"
  exit 1
fi

# shellcheck source=./categorize.sh
source "$LOCAL_REPO/scripts/categorize.sh"

echo "[sync-to-drive] $(date '+%Y-%m-%d %H:%M:%S') — Turbo → Drive"

# 1:1 mirror sections (hero, lifestyle, archive)
rsync -av --delete --exclude='.DS_Store' "$LOCAL_MEDIA/hero/"      "$DRIVE_ROOT/02-Hero/"      | tail -3
rsync -av --delete --exclude='.DS_Store' "$LOCAL_MEDIA/lifestyle/" "$DRIVE_ROOT/04-Lifestyle/" | tail -3
[[ -d "$LOCAL_MEDIA/archive" ]] && rsync -av --exclude='.DS_Store' "$LOCAL_MEDIA/archive/" "$DRIVE_ROOT/99-Archive/" | tail -3

# Categorized products: each .webp goes to 03-Products/web/{category}/
# (local stays flat — this is the Drive view for humans/fleet)
echo "[sync-to-drive] categorizing products..."
PRODUCTS_DEST="$DRIVE_ROOT/03-Products/web"
copied=0
skipped=0
shopt -s nullglob
for f in "$LOCAL_MEDIA/products/"*.webp; do
  base="$(basename "$f")"
  cat="$(categorize "$base")"
  dest="$PRODUCTS_DEST/$cat/$base"
  if [[ -f "$dest" ]] && [[ "$f" -ot "$dest" || ! "$f" -nt "$dest" ]]; then
    skipped=$((skipped+1))
  else
    cp -p "$f" "$dest"
    copied=$((copied+1))
  fi
done
echo "[sync-to-drive] products: $copied copied, $skipped already current"

# Manifest + brand docs
cp "$LOCAL_MEDIA/MANIFEST.md" "$DRIVE_ROOT/00-MANIFEST.md"
cp "$LOCAL_REPO/CLAUDE.md"   "$DRIVE_ROOT/01-Brand/CLAUDE.md"
cp "$LOCAL_REPO/scripts/categorize.sh" "$DRIVE_ROOT/01-Brand/categorize.sh"

echo "[sync-to-drive] complete."
