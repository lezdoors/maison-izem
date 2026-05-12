# Maison Izem — Database & Launch Assets

This folder holds the SQL + CSV needed to seed the launch catalog into Supabase and Etsy.

## Files

| File | Purpose | When to run |
|---|---|---|
| `seed-pdp-launch.sql` | 32 SKU INSERTs with pricing, descriptions, dimensions, materials, craftsman, single PDP-white image | First — drops the 32 launch SKUs into `products` |
| `update-image-arrays.sql` | UPDATEs each SKU's `images` jsonb array to the full 5–6 shot gallery (PDP, scale, lit, macro, alt, editorial) | After `seed-pdp-launch.sql` — wires the full gallery |
| `etsy-listings.csv` | 32 SKU rows in bulk-listing CSV format with titles, descriptions, tags, materials, all 7 photo URLs | When ready to upload to Etsy (via Vela, EtsyRank, or the Etsy MCP once OAuth is done) |

## Exact run order

1. **Open Supabase Dashboard** → SQL Editor → New query  
   https://supabase.com/dashboard/project/unsenfjlqqqjibbnbpur

2. **Paste `seed-pdp-launch.sql`** → Run. Should INSERT 32 rows.
   - Verify: the final `SELECT category, count(*)` returns 5 categories (Lighting=22, Wall Decor=5, Vessels=5, plus existing Furniture/Tables/Poufs).

3. **Paste `update-image-arrays.sql`** → Run. Should UPDATE 32 rows.
   - Verify: the final `SELECT slug, jsonb_array_length(images)` returns 6 for most, 5 for plates/vessels/mishaal-lantern.

4. **Visit a PDP** to confirm gallery renders:  
   - https://www.maisonizem.com/product?slug=noor-pendant (should show 6 images)
   - https://www.maisonizem.com/product?slug=tabaq-plate (should show 5 — no lit shot)

## Etsy upload

Two paths:

- **Bulk CSV** — `etsy-listings.csv` is in Vela-compatible format. Upload via Etsy's bulk listing tools or Vela.app. Manual review each before publishing.
- **API via MCP** — once the Etsy MCP server (`integrations/etsy-mcp/`) has OAuth credentials, the CSV rows can be fed through `createDraftListing` to create drafts programmatically. **Drafts only** until Ryan + Cowork green-light a first batch.

## Pricing tiers (locked 2026-05-12)

| Tier | Range | Examples |
|---|---|---|
| Entry | $295–$420 | mishbah-lantern, ibriq, fanar-lantern, riad-plate |
| Mid | $480–$695 | jarra, kasr, tabaq, manara-sconce, fanous-lamp, minbar-sconce, kandil-lamp, sandouq |
| Premium pendants | $750–$850 | noor, hilal, bayda, qubba, sirage, samar, nadia, zahra, mishkat |
| Statement | $1,150–$1,450 | layla, najma, falak, warda, bayt |

Anchor references: Anthropologie pendants $498–$1,498, RH brass pendants $895–$2,495, 1stDibs handmade Moroccan brass $400–$2,800. We sit mid-luxury intentionally — below $295 hurts perception, above $1,500 needs designer reach.

## Schema notes

- `images` is a jsonb array of relative paths. Vercel rewrite `/products/*` → `/media/products/*` handles delivery.
- All 32 SKUs share craftsman_id `9b38c7bf-140c-4317-82a8-ae4e8c52befc` (Omar Berrada — Marrakesh, Brass & Metalwork). When new craftsmen come online for Phase 2 (wood furniture, ceramics, poufs), add to `craftsmen` first then re-attribute.
- The `Lighting` category groups pendants + lamps + sconces + lanterns. If the site needs finer filters later, add a `subcategory` column rather than splitting the enum.
