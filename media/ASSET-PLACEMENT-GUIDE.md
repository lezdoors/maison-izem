# Maison Izem — Where to put photos and videos

Single-page rulebook for everyone working on Maison Izem assets (Turbo, Fury, Rocco, Mouha, Damouh, Cowork, Ryan, Oussama). Read once. Bookmark.

## TL;DR

**Need a product image to use?** Pull it from `Maison Izem/03-Products/web/{category}/`.

**Made a new product image?** Drop it in `Maison Izem/03-Products/web/{category}/` using the naming below.

**Made a new lifestyle / editorial / hero shot?** Drop it in `Maison Izem/02-Hero/web/` (hero) or `Maison Izem/04-Lifestyle/web/` (editorial features).

**Generated a 4K raw master that needs preserving?** Drop it in the same category folder under `raw/` (e.g. `Maison Izem/03-Products/raw/pendants/`) at PNG.

**Receiving raw supplier photos from Marrakech?** Drop them in `Maison Izem/05-Sources/marrakech-supplier/` — never directly into Products.

Do not put files at the root of any category folder. Always use `web/` or `raw/`.

## Folder map

```
Maison Izem/
├── 00-ASSET-PLACEMENT-GUIDE.md         ← this file
├── 00-MANIFEST.md                      ← registry of everything (Turbo maintains)
├── 01-Brand/                           ← brand rules + helper scripts
│   ├── CLAUDE.md
│   ├── categorize.sh                   ← slug → category resolver
│   ├── sync-to-drive.sh                ← local repo → Drive (Turbo runs)
│   ├── pull-from-drive.sh              ← Drive → local repo (anyone with the laptop)
│   └── cleanup-drive-products.sh       ← one-time tidier
├── 02-Hero/
│   ├── raw/                            ← 4K PNG masters
│   └── web/                            ← compressed WebP + MP4 for the site
├── 03-Products/
│   ├── raw/                            ← 4K PNG product masters per category
│   │   ├── pendants/
│   │   ├── lamps/
│   │   ├── sconces/
│   │   ├── lanterns/
│   │   ├── wall-plates/
│   │   ├── vessels/
│   │   ├── furniture/
│   │   ├── poufs/
│   │   ├── small-goods/
│   │   ├── tagines/
│   │   └── ceramics/                   ← Maison Chapuis line — separate brand
│   └── web/                            ← compressed WebP, same category tree
│       ├── pendants/
│       ├── lamps/
│       └── ... (same as above)
├── 04-Lifestyle/
│   ├── raw/                            ← 4K editorial / "Le Mag" feature stills
│   └── web/                            ← compressed for the site
├── 05-Sources/
│   ├── marrakech-supplier/             ← raw photos from Oussama / suppliers — staging only
│   └── higgsfield-jobs/                ← daily Higgsfield generation logs
└── 99-Archive/                         ← old/deprecated assets — never deleted
```

## Categories (use exactly these slugs)

| Category | What goes here | Examples |
|---|---|---|
| **pendants** | Hanging lights (any size, perforated brass, glass-and-brass) | chamss, amani, kamar, noor, hilal, layla |
| **lamps** | Table lamps (cylindrical body + shade, fanous globes) | fanous, kandil |
| **sconces** | Wall-mounted lights, wall appliques | diya, manara, minbar, applique |
| **lanterns** | Glass + brass decorative lanterns with chain | fanar, mishbah |
| **wall-plates** | Decorative wall plates / medallions (NOT dinnerware) | tabaq, khatam, shams, riad, tarsi |
| **vessels** | Urns, jars, kettles, footed tazza plates, decorative brass objects | jarra, sandouq, kasr, ibriq, tazza, saqayah, objet |
| **furniture** | Throne, dressers, side tables, beds, chests, mirrors, screens, coffee tables | kursi, nakch, nacre, bahut, gueridon, moucharabieh |
| **poufs** | Leather, kilim, sabra silk, hachkar | leather-pouf, kilim-pouf, sabra-pouf, hachkar |
| **small-goods** | Beldi drinkware (Maison Izem's line), trays | beldi-cup, beldi-glass, plateau |
| **tagines** | Cookware tagines | cooking-tagine, traditional-tagine, mini-tagine |
| **ceramics** | Maison Chapuis ceramics — SEPARATE BRAND, do not mix into Izem catalog | berber-essence, fez, safi, zagora, dinandier |

**Unsure of category?** Run `bash 01-Brand/categorize.sh your-filename.webp` and it prints the category it would file under. If it says `uncategorized`, append the pattern to `categorize.sh` or ask Turbo.

## Naming convention

```
{slug}-{shot-type}-{variant}.{ext}
```

| Part | Examples |
|---|---|
| **slug** | `chamss`, `noor-pendant`, `kursi-royal`, `leather-pouf-brown` — kebab-case, lowercase, no spaces |
| **shot-type** | `pdp-white` (primary on pure white cyclorama) · `hero-3-4` (gallery slot 1) · `side-left` · `side-right` · `back-3-4` · `macro-1` · `macro-2` · `lifestyle` · `lit-profile` (pendants only) |
| **variant** | `01`, `02`, `03` — omit if there's only one |
| **ext** | `.webp` for web · `.png` for raw 4K masters · `.mp4` for video |

Examples that are correct:
- `chamss-pdp-white-4k.png` → `Maison Izem/03-Products/raw/pendants/`
- `chamss-pdp-white.webp` → `Maison Izem/03-Products/web/pendants/`
- `noor-pendant-hero-3-4.webp` → `Maison Izem/03-Products/web/pendants/`
- `noor-pendant-lit-profile.webp` → `Maison Izem/03-Products/web/pendants/`
- `kursi-royal-macro-1.webp` → `Maison Izem/03-Products/web/furniture/`
- `hero-emerald-majorelle-loop-seamless.mp4` → `Maison Izem/02-Hero/web/`

Examples that are wrong:
- `IMG_4283.jpg` — no slug, no shot type
- `Chamss Pendant Hero.webp` — spaces, capital letters
- `chamss_pendant_hero.webp` — underscores instead of hyphens
- A file dropped at `Maison Izem/03-Products/` root — must go into `web/{category}/` or `raw/{category}/`

## Workflow

### You have a new product image and want it on the site

1. Save it locally with the right name (`{slug}-{shot-type}-{variant}.webp`).
2. Drop it into `Maison Izem/03-Products/web/{category}/`.
3. Tag Turbo in Slack / chat: "new product image — slug, category". Turbo will pull it into the live repo and deploy.
4. Or if you have the `lezdoors/maison-izem` repo cloned: run `bash ~/atlas-dark/scripts/pull-from-drive.sh`, then `git add`, commit, push.

### You have a new lifestyle / hero / editorial shot

1. Name it (`hero-{slug}-{shot-type}-{res}.ext` or `editorial-{slug}.webp`).
2. Drop in `Maison Izem/02-Hero/web/` (hero) or `Maison Izem/04-Lifestyle/web/` (editorial features for "Le Mag" section).
3. Same tag-Turbo workflow.

### You're generating 4K raw masters in Higgsfield

1. Save the 4K PNG locally first (in your output directory).
2. Copy into both:
   - `Maison Izem/03-Products/raw/{category}/{slug}-{shot-type}-4k.png` (preserve master)
   - Local repo `~/atlas-dark/media/products/raw/{category}/{slug}-{shot-type}-4k.png` (optional, gitignored)
3. Compress to WebP via `cwebp -q 88 ...png -o ...webp`.
4. Drop the WebP into `Maison Izem/03-Products/web/{category}/`.

### You receive raw photos from Oussama / Marrakech

1. Drop them in `Maison Izem/05-Sources/marrakech-supplier/`. Never into Products — those are supplier originals, not site-ready.
2. Tag whoever's running the restage pipeline (Turbo or Damouh).

## Rules of the road

- **Never put files at the root of `03-Products/`**. Always `web/{category}/` or `raw/{category}/`.
- **Never delete anything from `99-Archive/`**. Archive is forever.
- **Don't rename files in Drive**. If a rename is needed, do it locally and let sync overwrite.
- **Don't move ceramics into other categories** — Maison Chapuis is a separate brand.
- **Raw masters are preserved**, web is regeneratable. So always upload raw first if you have it.

## When in doubt

- Run `bash 01-Brand/categorize.sh your-filename.webp` for category resolution.
- Check `00-MANIFEST.md` for what's already shipped vs. pending.
- Ping Turbo for naming or placement decisions.
