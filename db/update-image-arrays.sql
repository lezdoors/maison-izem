-- Maison Izem — wire full 7-shot image arrays into each launch SKU
-- Run AFTER db/seed-pdp-launch.sql has been applied.
-- Project: unsenfjlqqqjibbnbpur
--
-- Image order in `images` jsonb array (gallery slot order on product.html):
--   1. PDP white (primary)
--   2. Scale shot (lifestyle in styled room)
--   3. Lit profile (lighting only, NULL for plates/vessels)
--   4. Macro detail
--   5. Alt angle on white
--   6. Editorial restage (warm-tadelakt)
--
-- All paths are relative; the Vercel rewrite /products/* -> /media/products/* handles delivery.

-- ============================================================
-- PENDANTS (14) — full 6-shot gallery
-- ============================================================
UPDATE products SET images = '["/products/pdp-white/noor-pendant-pdp-white.webp","/products/scale/noor-pendant-scale.webp","/products/lit/noor-pendant-lit.webp","/products/macro/noor-pendant-macro.webp","/products/alt-white/noor-pendant-alt-white.webp","/products/noor-pendant.webp"]'::jsonb WHERE slug='noor-pendant';
UPDATE products SET images = '["/products/pdp-white/hilal-pendant-pdp-white.webp","/products/scale/hilal-pendant-scale.webp","/products/lit/hilal-pendant-lit.webp","/products/macro/hilal-pendant-macro.webp","/products/alt-white/hilal-pendant-alt-white.webp","/products/hilal-pendant.webp"]'::jsonb WHERE slug='hilal-pendant';
UPDATE products SET images = '["/products/pdp-white/layla-pendant-pdp-white.webp","/products/scale/layla-pendant-scale.webp","/products/lit/layla-pendant-lit.webp","/products/macro/layla-pendant-macro.webp","/products/alt-white/layla-pendant-alt-white.webp","/products/layla-pendant.webp"]'::jsonb WHERE slug='layla-pendant';
UPDATE products SET images = '["/products/pdp-white/najma-pendant-pdp-white.webp","/products/scale/najma-pendant-scale.webp","/products/lit/najma-pendant-lit.webp","/products/macro/najma-pendant-macro.webp","/products/alt-white/najma-pendant-alt-white.webp","/products/najma-pendant.webp"]'::jsonb WHERE slug='najma-pendant';
UPDATE products SET images = '["/products/pdp-white/falak-pendant-pdp-white.webp","/products/scale/falak-pendant-scale.webp","/products/lit/falak-pendant-lit.webp","/products/macro/falak-pendant-macro.webp","/products/alt-white/falak-pendant-alt-white.webp","/products/falak-pendant.webp"]'::jsonb WHERE slug='falak-pendant';
UPDATE products SET images = '["/products/pdp-white/warda-pendant-pdp-white.webp","/products/scale/warda-pendant-scale.webp","/products/lit/warda-pendant-lit.webp","/products/macro/warda-pendant-macro.webp","/products/alt-white/warda-pendant-alt-white.webp","/products/warda-pendant.webp"]'::jsonb WHERE slug='warda-pendant';
UPDATE products SET images = '["/products/pdp-white/bayt-pendant-pdp-white.webp","/products/scale/bayt-pendant-scale.webp","/products/lit/bayt-pendant-lit.webp","/products/macro/bayt-pendant-macro.webp","/products/alt-white/bayt-pendant-alt-white.webp","/products/bayt-pendant.webp"]'::jsonb WHERE slug='bayt-pendant';
UPDATE products SET images = '["/products/pdp-white/bayda-pendant-pdp-white.webp","/products/scale/bayda-pendant-scale.webp","/products/lit/bayda-pendant-lit.webp","/products/macro/bayda-pendant-macro.webp","/products/alt-white/bayda-pendant-alt-white.webp","/products/bayda-pendant.webp"]'::jsonb WHERE slug='bayda-pendant';
UPDATE products SET images = '["/products/pdp-white/qubba-pendant-pdp-white.webp","/products/scale/qubba-pendant-scale.webp","/products/lit/qubba-pendant-lit.webp","/products/macro/qubba-pendant-macro.webp","/products/alt-white/qubba-pendant-alt-white.webp","/products/qubba-pendant.webp"]'::jsonb WHERE slug='qubba-pendant';
UPDATE products SET images = '["/products/pdp-white/sirage-pendant-pdp-white.webp","/products/scale/sirage-pendant-scale.webp","/products/lit/sirage-pendant-lit.webp","/products/macro/sirage-pendant-macro.webp","/products/alt-white/sirage-pendant-alt-white.webp","/products/sirage-pendant.webp"]'::jsonb WHERE slug='sirage-pendant';
UPDATE products SET images = '["/products/pdp-white/samar-pendant-pdp-white.webp","/products/scale/samar-pendant-scale.webp","/products/lit/samar-pendant-lit.webp","/products/macro/samar-pendant-macro.webp","/products/alt-white/samar-pendant-alt-white.webp","/products/samar-pendant.webp"]'::jsonb WHERE slug='samar-pendant';
UPDATE products SET images = '["/products/pdp-white/nadia-pendant-pdp-white.webp","/products/scale/nadia-pendant-scale.webp","/products/lit/nadia-pendant-lit.webp","/products/macro/nadia-pendant-macro.webp","/products/alt-white/nadia-pendant-alt-white.webp","/products/nadia-pendant.webp"]'::jsonb WHERE slug='nadia-pendant';
UPDATE products SET images = '["/products/pdp-white/zahra-pendant-pdp-white.webp","/products/scale/zahra-pendant-scale.webp","/products/lit/zahra-pendant-lit.webp","/products/macro/zahra-pendant-macro.webp","/products/alt-white/zahra-pendant-alt-white.webp","/products/zahra-pendant.webp"]'::jsonb WHERE slug='zahra-pendant';
UPDATE products SET images = '["/products/pdp-white/mishkat-pendant-pdp-white.webp","/products/scale/mishkat-pendant-scale.webp","/products/lit/mishkat-pendant-lit.webp","/products/macro/mishkat-pendant-macro.webp","/products/alt-white/mishkat-pendant-alt-white.webp","/products/mishkat-pendant.webp"]'::jsonb WHERE slug='mishkat-pendant';

-- ============================================================
-- LAMPS (2)
-- ============================================================
UPDATE products SET images = '["/products/pdp-white/fanous-lamp-pdp-white.webp","/products/scale/fanous-lamp-scale.webp","/products/lit/fanous-lamp-lit.webp","/products/macro/fanous-lamp-macro.webp","/products/alt-white/fanous-lamp-alt-white.webp","/products/fanous-lamp.webp"]'::jsonb WHERE slug='fanous-lamp';
UPDATE products SET images = '["/products/pdp-white/kandil-lamp-pdp-white.webp","/products/scale/kandil-lamp-scale.webp","/products/lit/kandil-lamp-lit.webp","/products/macro/kandil-lamp-macro.webp","/products/alt-white/kandil-lamp-alt-white.webp","/products/kandil-lamp.webp"]'::jsonb WHERE slug='kandil-lamp';

-- ============================================================
-- SCONCES (3)
-- ============================================================
UPDATE products SET images = '["/products/pdp-white/diya-sconce-pdp-white.webp","/products/scale/diya-sconce-scale.webp","/products/lit/diya-sconce-lit.webp","/products/macro/diya-sconce-macro.webp","/products/alt-white/diya-sconce-alt-white.webp","/products/diya-sconce.webp"]'::jsonb WHERE slug='diya-sconce';
UPDATE products SET images = '["/products/pdp-white/manara-sconce-pdp-white.webp","/products/scale/manara-sconce-scale.webp","/products/lit/manara-sconce-lit.webp","/products/macro/manara-sconce-macro.webp","/products/alt-white/manara-sconce-alt-white.webp","/products/manara-sconce.webp"]'::jsonb WHERE slug='manara-sconce';
UPDATE products SET images = '["/products/pdp-white/minbar-sconce-pdp-white.webp","/products/scale/minbar-sconce-scale.webp","/products/lit/minbar-sconce-lit.webp","/products/macro/minbar-sconce-macro.webp","/products/alt-white/minbar-sconce-alt-white.webp","/products/minbar-sconce.webp"]'::jsonb WHERE slug='minbar-sconce';

-- ============================================================
-- LANTERNS (3) — mishaal has no editorial restage yet
-- ============================================================
UPDATE products SET images = '["/products/pdp-white/fanar-lantern-pdp-white.webp","/products/scale/fanar-lantern-scale.webp","/products/lit/fanar-lantern-lit.webp","/products/macro/fanar-lantern-macro.webp","/products/alt-white/fanar-lantern-alt-white.webp","/products/fanar-lantern.webp"]'::jsonb WHERE slug='fanar-lantern';
UPDATE products SET images = '["/products/pdp-white/mishbah-lantern-pdp-white.webp","/products/scale/mishbah-lantern-scale.webp","/products/lit/mishbah-lantern-lit.webp","/products/macro/mishbah-lantern-macro.webp","/products/alt-white/mishbah-lantern-alt-white.webp","/products/mishbah-lantern.webp"]'::jsonb WHERE slug='mishbah-lantern';
UPDATE products SET images = '["/products/pdp-white/mishaal-lantern-pdp-white.webp","/products/scale/mishaal-lantern-scale.webp","/products/lit/mishaal-lantern-lit.webp","/products/macro/mishaal-lantern-macro.webp","/products/alt-white/mishaal-lantern-alt-white.webp"]'::jsonb WHERE slug='mishaal-lantern';

-- ============================================================
-- WALL PLATES (5) — no lit shot (non-light-emitting)
-- ============================================================
UPDATE products SET images = '["/products/pdp-white/tabaq-plate-pdp-white.webp","/products/scale/tabaq-plate-scale.webp","/products/macro/tabaq-plate-macro.webp","/products/alt-white/tabaq-plate-alt-white.webp","/products/tabaq-plate.webp"]'::jsonb WHERE slug='tabaq-plate';
UPDATE products SET images = '["/products/pdp-white/khatam-plate-pdp-white.webp","/products/scale/khatam-plate-scale.webp","/products/macro/khatam-plate-macro.webp","/products/alt-white/khatam-plate-alt-white.webp","/products/khatam-plate.webp"]'::jsonb WHERE slug='khatam-plate';
UPDATE products SET images = '["/products/pdp-white/shams-plate-pdp-white.webp","/products/scale/shams-plate-scale.webp","/products/macro/shams-plate-macro.webp","/products/alt-white/shams-plate-alt-white.webp","/products/shams-plate.webp"]'::jsonb WHERE slug='shams-plate';
UPDATE products SET images = '["/products/pdp-white/riad-plate-pdp-white.webp","/products/scale/riad-plate-scale.webp","/products/macro/riad-plate-macro.webp","/products/alt-white/riad-plate-alt-white.webp","/products/riad-plate.webp"]'::jsonb WHERE slug='riad-plate';
UPDATE products SET images = '["/products/pdp-white/tarsi-plate-pdp-white.webp","/products/scale/tarsi-plate-scale.webp","/products/macro/tarsi-plate-macro.webp","/products/alt-white/tarsi-plate-alt-white.webp","/products/tarsi-plate.webp"]'::jsonb WHERE slug='tarsi-plate';

-- ============================================================
-- VESSELS (5) — no lit shot
-- ============================================================
UPDATE products SET images = '["/products/pdp-white/jarra-vessel-pdp-white.webp","/products/scale/jarra-vessel-scale.webp","/products/macro/jarra-vessel-macro.webp","/products/alt-white/jarra-vessel-alt-white.webp","/products/jarra-vessel.webp"]'::jsonb WHERE slug='jarra-vessel';
UPDATE products SET images = '["/products/pdp-white/sandouq-vessel-pdp-white.webp","/products/scale/sandouq-vessel-scale.webp","/products/macro/sandouq-vessel-macro.webp","/products/alt-white/sandouq-vessel-alt-white.webp","/products/sandouq-vessel.webp"]'::jsonb WHERE slug='sandouq-vessel';
UPDATE products SET images = '["/products/pdp-white/kasr-vessel-pdp-white.webp","/products/scale/kasr-vessel-scale.webp","/products/macro/kasr-vessel-macro.webp","/products/alt-white/kasr-vessel-alt-white.webp","/products/kasr-vessel.webp"]'::jsonb WHERE slug='kasr-vessel';
UPDATE products SET images = '["/products/pdp-white/ibriq-vessel-pdp-white.webp","/products/scale/ibriq-vessel-scale.webp","/products/macro/ibriq-vessel-macro.webp","/products/alt-white/ibriq-vessel-alt-white.webp","/products/ibriq-vessel.webp"]'::jsonb WHERE slug='ibriq-vessel';
UPDATE products SET images = '["/products/pdp-white/tazza-vessel-pdp-white.webp","/products/scale/tazza-vessel-scale.webp","/products/macro/tazza-vessel-macro.webp","/products/alt-white/tazza-vessel-alt-white.webp","/products/tazza-vessel.webp"]'::jsonb WHERE slug='tazza-vessel';

-- Verify
SELECT slug, jsonb_array_length(images) AS shot_count FROM products WHERE slug IN (
  'noor-pendant','fanous-lamp','diya-sconce','fanar-lantern','tabaq-plate','jarra-vessel','mishaal-lantern'
) ORDER BY slug;
