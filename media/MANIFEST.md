# Maison Izem — Media Manifest

Single source of truth for every photographic and video asset in the brand. Mirrored to Google Drive at `~/Library/CloudStorage/GoogleDrive-ryanaoufal@gmail.com/My Drive/Maison Izem/` so any clawdbot machine (Turbo, Fury, Rocco, Mouha) can pull current assets.

## Folder layout

```
atlas-dark/media/         Drive: Maison Izem/
├── hero/                 02-Hero/
│   ├── raw/              raw/    4K masters (PNG, lossless MP4)
│   └── web/              web/    Compressed web-ready (WebP, MP4 H.264 1080p)
├── products/             03-Products/
│   ├── raw/              raw/    4K PDP masters on pure white cyclorama
│   │   └── {category}/           pendants, lamps, sconces, lanterns, plates, vessels, furniture, poufs
│   └── web/              web/    Compressed WebP for live site
│       └── {category}/
├── lifestyle/            04-Lifestyle/
│   ├── raw/              raw/    4K lifestyle context shots
│   └── web/              web/    Compressed WebP
├── archive/              99-Archive/    Deprecated assets (warm-riad hero candidates, supplier shots after restage)
                          05-Sources/    Drive-only: supplier photos, Higgsfield job logs (not shipped to site)
                          01-Brand/      Drive-only: brand guidelines, logos, this manifest mirror
```

**Drive is the superset.** Local `media/` ships in the Vercel build — it holds only what the live site needs (`hero/web`, `products/web`, `lifestyle/web` primarily; `*/raw` kept local for re-export). Drive additionally holds `05-Sources/` (supplier originals, generation job logs) and `99-Archive/` (the historical record) so the fleet can audit and reproduce.

## Naming convention

```
{category}-{slug}-{shot-type}-{variant}-{resolution}.{ext}
```

- **category** — `hero` · `product` · `lifestyle` · `editorial`
- **slug** — kebab-case product or scene identifier (e.g. `noor-pendant`, `emerald-majorelle`)
- **shot-type** — `pdp-white` · `hero-3-4` · `side-left` · `side-right` · `back-3-4` · `macro-1` · `macro-2` · `lifestyle` · `poster` · `loop`
- **variant** — `01` · `02` · `03` (omit if only one)
- **resolution** — `4k` · `2k` · `web` (web = compressed deliverable, no resolution suffix needed on raw masters which are always 4k+)
- **ext** — `.webp` for web stills, `.png` for raw stills, `.mp4` for video

Examples:
- `hero-emerald-majorelle-poster-4k.png` (raw 4K poster master)
- `hero-emerald-majorelle-poster.webp` (compressed web poster)
- `hero-emerald-majorelle-loop-4k.mp4` (raw 4K video master)
- `hero-emerald-majorelle-loop.mp4` (compressed web video)
- `product-noor-pendant-pdp-white-4k.webp` (PDP primary on pure white)
- `product-noor-pendant-hero-3-4.webp` (gallery slot 1)
- `product-noor-pendant-side-left.webp` (gallery slot 2)
- `product-noor-pendant-macro-1.webp` (detail close-up)
- `lifestyle-mansour-grand-salon-01.webp` (lifestyle context)

## Asset registry

### Hero (in progress)

| File | Source | Status | Created | Higgsfield job |
|------|--------|--------|---------|----------------|
| hero-emerald-majorelle-poster-4k.png | nano_banana_2 4K | shipped | 2026-05-11 | e5ae1c50-9193-40ed-939b-215a1c95b57b |
| hero-emerald-majorelle-poster.webp | cwebp q88 | shipped | 2026-05-11 | derived |
| hero-emerald-majorelle-loop-720p.mp4 (raw master, 720p H.264 15s) | cinematic_studio_3_0 | shipped | 2026-05-11 | 162c6a82-0ef1-40fc-ada7-3516fd7cb3fc |
| hero-emerald-majorelle-loop.mp4 (web, 720p slow preset crf22 faststart, no audio) | ffmpeg | shipped | 2026-05-11 | derived |
| hero-emerald-majorelle-loop-1080p.mp4 (1080p lanczos upscale, web-ready) | ffmpeg | shipped | 2026-05-11 | derived |
| hero-emerald-majorelle-loop-seamless.mp4 (palindrome 30s for true seamless loop) | ffmpeg | shipped | 2026-05-11 | derived |
| hero4k-b-cobalt-mansour | nano_banana_2 4K | rejected (theatrical) | 2026-05-11 | ad46e403-c94c-4234-af2a-2a24ee90245f |
| hero4k-c-mahjong | nano_banana_2 4K | rejected (derivative) | 2026-05-11 | b55d418f-21cf-4ba6-8afd-c482b1ee9ca0 |
| hero-candidate-{01..05}.mp4 | older Higgsfield (warm-riad) | ARCHIVED | 2026-05-10 | various |
| hero-loop.mp4 | older (warm-riad) | ARCHIVED | 2026-05-10 | — |

### Products — atelier restages shipped 2026-05-11 (warm-tadelakt context, used in editorial sections)

Pendants (14): noor, hilal, layla, najma, falak, warda, bayt, bayda, qubba, sirage, samar, nadia, zahra, mishkat
Lamps (2): fanous, kandil
Sconces (3): diya, manara, minbar
Lanterns (2): fanar, mishbah
Plates (5): tabaq, khatam, shams, riad, tarsi
Vessels (5): jarra, sandouq, kasr, ibriq, tazza

Each exists as `media/products/{slug}.webp` (warm-tadelakt, editorial use).

### Products — PDP white-cyclorama batch shipped 2026-05-11 (Roche-Bobois / Anthropologie register)

32 PDP primary shots, pure white seamless infinity cyclorama, 4:5 vertical, generated via Higgsfield `nano_banana_2` image-to-image at 2k aspect using `media/products/{slug}.webp` as reference (form preserved, background swapped).

Pendants (14): noor, hilal, layla, najma, falak, warda, bayt, bayda, qubba, sirage, samar, nadia, zahra, mishkat
Lamps (2): fanous, kandil
Sconces (3): diya, manara, minbar
Lanterns (3): fanar, mishbah, mishaal (regenerated from broken atelier-lantern-03 with plastic wrap removed)
Wall plates (5): tabaq, khatam, shams, riad, tarsi
Vessels (5): jarra, sandouq, kasr, ibriq, tazza

Files:
- `media/products/pdp-white/{slug}-pdp-white.webp` — 7.9MB total, ships in Vercel
- `media/products/raw/{slug}-pdp-white-2k.png` — 168MB total, gitignored, lives in Drive only

Drive mirror: `03-Products/web/{category}/` (auto-categorized by `scripts/sync-to-drive.sh`).

### Wood furniture (Damouh's Phase 1 — pending regeneration in new direction)

10 SKUs identified in his master plan: throne-chair, hammam-fountain, mother-of-pearl-side-table, bone-inlay-bed-set, bone-inlay-side-tables, octagonal-coffee-table-{01,02,03}, painted-dresser, painted-chest.

Current files in `media/` root are **raw supplier shots, NOT renders** (man-leaning-on-table, motorbike-behind-dresser, plastic-wrap visible). These move to `archive/` once Damouh produces clean renders in the new bright-Moroccan-luxury direction.

## Maintenance protocol

1. **Every new asset** gets a row in this registry on save.
2. **Naming convention enforced** — bad names get renamed before commit.
3. **Drive sync** — run `~/atlas-dark/scripts/sync-to-drive.sh` after a generation batch. The script rsync's local `media/` to Drive `Maison Izem/` and copies non-site assets (sources, archive) one-way back from Drive to local where useful.
4. **Higgsfield job log** — every generation job's prompt + cloudfront URL + result file gets a one-line entry in `Drive/05-Sources/higgsfield-jobs/{YYYY-MM-DD}.md`. Reproducibility.
5. **Archive promotion** — when an asset is replaced, move the old version to `archive/` with a date suffix (e.g. `hero-loop-2026-05-10-warm-riad.mp4`). Never delete; we may need the heritage version for the dark `/atelier` page.
6. **Cross-machine access** — Drive is the read source for Fury/Rocco/Mouha. They pull via the same path. Local `~/atlas-dark/media/` is Turbo's working copy and the Vercel deploy source.
