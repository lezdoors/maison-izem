#!/bin/bash
# Maison Izem — Drive sync (Turbo authoritative → Drive mirror)
# Mirrors ~/atlas-dark/media/ to Google Drive "Maison Izem/" so the fleet can access.
# Drive is a superset: it gets all atlas-dark/media/ content PLUS retains its own 05-Sources and 01-Brand.

set -euo pipefail

LOCAL_MEDIA="$HOME/atlas-dark/media"
DRIVE_ROOT="$HOME/Library/CloudStorage/GoogleDrive-ryanaoufal@gmail.com/My Drive/Maison Izem"

if [[ ! -d "$DRIVE_ROOT" ]]; then
  echo "ERROR: Drive mount missing — $DRIVE_ROOT"
  echo "Is Google Drive desktop running and Maison Izem folder created?"
  exit 1
fi

echo "[sync-to-drive] $(date '+%Y-%m-%d %H:%M:%S') — Turbo → Drive"

# Mirror local media subdirs to their Drive counterparts.
# Drive folders are prefixed with 02-, 03-, 04- for sort order; local is unprefixed.
rsync -av --delete --exclude='.DS_Store' "$LOCAL_MEDIA/hero/"      "$DRIVE_ROOT/02-Hero/"      | tail -5
rsync -av --delete --exclude='.DS_Store' "$LOCAL_MEDIA/products/"  "$DRIVE_ROOT/03-Products/"  | tail -5
rsync -av --delete --exclude='.DS_Store' "$LOCAL_MEDIA/lifestyle/" "$DRIVE_ROOT/04-Lifestyle/" | tail -5

# Archive is one-way mirror (preserve all history) — no --delete.
[[ -d "$LOCAL_MEDIA/archive" ]] && rsync -av --exclude='.DS_Store' "$LOCAL_MEDIA/archive/" "$DRIVE_ROOT/99-Archive/" | tail -5

# Manifest mirror
cp "$LOCAL_MEDIA/MANIFEST.md" "$DRIVE_ROOT/00-MANIFEST.md"
cp "$HOME/atlas-dark/CLAUDE.md" "$DRIVE_ROOT/01-Brand/CLAUDE.md"

echo "[sync-to-drive] complete."
