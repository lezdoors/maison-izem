-- Maison Izem — Launch catalog seed (32 SKUs)
-- Run via Supabase Dashboard → SQL Editor → New query → paste → Run
-- Project: unsenfjlqqqjibbnbpur
-- Created: 2026-05-11
--
-- Pricing tier rationale:
--   Anchor points: Anthropologie pendants $498–$1,498 · RH brass pendants $895–$2,495 ·
--   Apparatus sconces $1,200+ · 1stDibs handmade Moroccan brass $400–$2,800.
--   We sit mid-luxury: small handmade pendant $750, statement $1,150, hero $1,450.
--   Below $295 we lose perceived value; above $1,500 we need designer reach (Tier-2 push).
--   All prices in USD cents (Stripe convention).
--
-- Image array convention:
--   [primary white PDP first, editorial/lifestyle second]
--   Macro/alt/lit shots get appended after generation (Phase 2).
--
-- Craftsman: all 32 SKUs are Marrakesh brass/copper metalwork → Omar Berrada
--   (id = '9b38c7bf-140c-4317-82a8-ae4e8c52befc')
--
-- Category strategy:
--   Reuses existing 'Lighting' (pendants/lamps/sconces/lanterns share one filter).
--   Introduces 'Wall Decor' and 'Vessels' for the non-light categories.
--   Site filter UI lives in collection.html — add the two new chips after this runs.

------------------------------------------------------------------------
-- PENDANTS (14 SKUs) — Lighting
------------------------------------------------------------------------

INSERT INTO products (slug, title, description, price, images, category, dimensions, weight_lbs, materials, craftsman_id, available_quantity, status, featured) VALUES

('noor-pendant', 'noor pendant',
 'Hand-pierced brass globe suspended on a single brass cord. The name means light. Casts an intricate geometric pattern when lit.',
 75000,
 '["/products/pdp-white/noor-pendant-pdp-white.webp","/products/noor-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"10in","height":"14in","cord":"60in"}'::jsonb,
 6,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', true),

('hilal-pendant', 'hilal pendant',
 'Crescent-form pendant in pierced brass. Cool light through a hand-cut star pattern. Made by a single artisan in the Marrakesh medina.',
 85000,
 '["/products/pdp-white/hilal-pendant-pdp-white.webp","/products/hilal-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"12in","height":"15in","cord":"60in"}'::jsonb,
 7,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', false),

('layla-pendant', 'layla pendant',
 'Statement pendant in aged brass. Layla means night. The pierced shell projects a slow constellation across the ceiling.',
 115000,
 '["/products/pdp-white/layla-pendant-pdp-white.webp","/products/layla-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"16in","height":"20in","cord":"72in"}'::jsonb,
 11,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 2, 'available', true),

('najma-pendant', 'najma pendant',
 'Eight-point star geometry hand-cut into a brass dome. Najma means star. Heavier in the hand than it looks.',
 115000,
 '["/products/pdp-white/najma-pendant-pdp-white.webp","/products/najma-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"15in","height":"18in","cord":"72in"}'::jsonb,
 10,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 2, 'available', false),

('falak-pendant', 'falak pendant',
 'Celestial sphere in pierced brass. Falak refers to the orbit of the stars. Densely patterned, with a deep amber cast when lit.',
 115000,
 '["/products/pdp-white/falak-pendant-pdp-white.webp","/products/falak-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"15in","height":"18in","cord":"72in"}'::jsonb,
 10,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 2, 'available', true),

('warda-pendant', 'warda pendant',
 'Rose-petal piercework on a soft-edged brass globe. Warda means rose. The pattern is denser at the crown and opens at the base.',
 115000,
 '["/products/pdp-white/warda-pendant-pdp-white.webp","/products/warda-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"14in","height":"17in","cord":"72in"}'::jsonb,
 9,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', false),

('bayt-pendant', 'bayt pendant',
 'Hero pendant. Two-tier brass dome with hand-cut moucharabieh fretwork. Bayt means dwelling. Anchors a dining table or a stair landing.',
 145000,
 '["/products/pdp-white/bayt-pendant-pdp-white.webp","/products/bayt-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"22in","height":"26in","cord":"72in"}'::jsonb,
 18,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 1, 'available', true),

('bayda-pendant', 'bayda pendant',
 'Egg-form pendant in polished brass. Bayda means white, or egg. Smooth surface with a single chiseled equatorial line.',
 75000,
 '["/products/pdp-white/bayda-pendant-pdp-white.webp","/products/bayda-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"9in","height":"13in","cord":"60in"}'::jsonb,
 5,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 4, 'available', false),

('qubba-pendant', 'qubba pendant',
 'Dome-form pendant referencing the qubba of a saint shrine. Pierced brass crown, plain skirt. Hangs solemn.',
 75000,
 '["/products/pdp-white/qubba-pendant-pdp-white.webp","/products/qubba-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"11in","height":"15in","cord":"60in"}'::jsonb,
 6,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', false),

('sirage-pendant', 'sirage pendant',
 'Sirage is the lamp that gives light in the dark. Tapered brass body, pierced in a vertical wheat pattern.',
 75000,
 '["/products/pdp-white/sirage-pendant-pdp-white.webp","/products/sirage-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"9in","height":"16in","cord":"60in"}'::jsonb,
 6,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 4, 'available', false),

('samar-pendant', 'samar pendant',
 'Samar means evening conversation. Wide low-slung brass shade, warm light pooled at the table.',
 75000,
 '["/products/pdp-white/samar-pendant-pdp-white.webp","/products/samar-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"13in","height":"10in","cord":"60in"}'::jsonb,
 7,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', false),

('nadia-pendant', 'nadia pendant',
 'Nadia means the one who announces. Pierced brass bell with a tapered finial. Crisp light, narrow throw.',
 75000,
 '["/products/pdp-white/nadia-pendant-pdp-white.webp","/products/nadia-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"9in","height":"14in","cord":"60in"}'::jsonb,
 5,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 4, 'available', false),

('zahra-pendant', 'zahra pendant',
 'Zahra means blossom. Six-petal piercework on a hand-spun brass globe. Soft directional light.',
 75000,
 '["/products/pdp-white/zahra-pendant-pdp-white.webp","/products/zahra-pendant.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"10in","height":"14in","cord":"60in"}'::jsonb,
 6,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', false),

('mishkat-pendant', 'mishkat pendant',
 'Mishkat is the niche of light. Squared brass form with a frontal pierced panel. Architectural, reads almost lantern-like.',
 85000,
 '["/products/pdp-white/mishkat-pendant-pdp-white.webp","/products/mishkat-pendant.webp"]'::jsonb,
 'Lighting',
 '{"width":"10in","height":"16in","depth":"10in","cord":"60in"}'::jsonb,
 8,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 2, 'available', false),

------------------------------------------------------------------------
-- TABLE LAMPS (2 SKUs) — Lighting
------------------------------------------------------------------------

('fanous-lamp', 'fanous table lamp',
 'Cylindrical perforated brass body with a natural linen shade. Fanous is the lantern of the souks. Sits beside a reading chair.',
 69500,
 '["/products/pdp-white/fanous-lamp-pdp-white.webp","/products/fanous-lamp.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"9in","height":"24in"}'::jsonb,
 7,
 ARRAY['Hand-hammered brass','Linen','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', true),

('kandil-lamp', 'kandil table lamp',
 'Kandil is the oil lamp of the medersa. A simpler brass column, pierced in a single repeating motif. Linen shade.',
 59500,
 '["/products/pdp-white/kandil-lamp-pdp-white.webp","/products/kandil-lamp.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"8in","height":"22in"}'::jsonb,
 6,
 ARRAY['Hand-hammered brass','Linen','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 4, 'available', false),

------------------------------------------------------------------------
-- SCONCES (3 SKUs) — Lighting
------------------------------------------------------------------------

('diya-sconce', 'diya wall sconce',
 'Oval copper reflector with a small cupped flame holder. Diya is the lamp of the household altar. Hand-raised, soft hammer marks visible.',
 38500,
 '["/products/pdp-white/diya-sconce-pdp-white.webp","/products/diya-sconce.webp"]'::jsonb,
 'Lighting',
 '{"width":"7in","height":"13in","depth":"6in"}'::jsonb,
 3,
 ARRAY['Hand-raised copper','Brass cup'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 6, 'available', false),

('manara-sconce', 'manara wall sconce',
 'Manara means minaret. Tall pierced brass column mounted on a flat plate. Throws a slow vertical pattern up the wall.',
 49500,
 '["/products/pdp-white/manara-sconce-pdp-white.webp","/products/manara-sconce.webp"]'::jsonb,
 'Lighting',
 '{"width":"6in","height":"18in","depth":"5in"}'::jsonb,
 4,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 5, 'available', false),

('minbar-sconce', 'minbar wall sconce',
 'Minbar is the pulpit of the mosque. Architectural sconce with a stepped brass façade and a recessed lamp behind it. Reads as wall sculpture.',
 62500,
 '["/products/pdp-white/minbar-sconce-pdp-white.webp","/products/minbar-sconce.webp"]'::jsonb,
 'Lighting',
 '{"width":"9in","height":"14in","depth":"7in"}'::jsonb,
 6,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 4, 'available', false),

------------------------------------------------------------------------
-- LANTERNS (3 SKUs) — Lighting
------------------------------------------------------------------------

('fanar-lantern', 'fanar lantern',
 'Fanar means lighthouse. Pierced brass crown over hand-blown clear glass panels. Hangs by chain, also stands on a console.',
 34500,
 '["/products/pdp-white/fanar-lantern-pdp-white.webp","/products/fanar-lantern.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"8in","height":"18in"}'::jsonb,
 4,
 ARRAY['Hand-hammered brass','Hand-blown glass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 6, 'available', false),

('mishbah-lantern', 'mishbah lantern',
 'Mishbah is the lamp lit before dawn. Smaller scale, glass-paneled, brass armature. For a console or a low table beside a window.',
 29500,
 '["/products/pdp-white/mishbah-lantern-pdp-white.webp","/products/mishbah-lantern.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"7in","height":"15in"}'::jsonb,
 3,
 ARRAY['Hand-hammered brass','Hand-blown glass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 8, 'available', false),

('mishaal-lantern', 'mishaal lantern',
 'Mishaal is the torch carried at the head of a procession. Tall hexagonal lantern with hand-cut filigree at the crown.',
 38500,
 '["/products/pdp-white/mishaal-lantern-pdp-white.webp"]'::jsonb,
 'Lighting',
 '{"diameter":"7in","height":"20in"}'::jsonb,
 4,
 ARRAY['Hand-hammered brass','Hand-blown glass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 5, 'available', false),

------------------------------------------------------------------------
-- WALL PLATES (5 SKUs) — Wall Decor
------------------------------------------------------------------------

('tabaq-plate', 'tabaq wall medallion',
 'Tabaq is the platter that holds the meal. Densely chiseled brass disk, raised concentric ring at the center. Reads as wall sculpture.',
 58000,
 '["/products/pdp-white/tabaq-plate-pdp-white.webp","/products/tabaq-plate.webp"]'::jsonb,
 'Wall Decor',
 '{"diameter":"18in","depth":"1.5in"}'::jsonb,
 5,
 ARRAY['Chiseled brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', true),

('khatam-plate', 'khatam wall medallion',
 'Khatam means the seal. Eight-point star at the center within concentric chiseled rings. Hung above a console or a bed.',
 48000,
 '["/products/pdp-white/khatam-plate-pdp-white.webp","/products/khatam-plate.webp"]'::jsonb,
 'Wall Decor',
 '{"diameter":"16in","depth":"1.25in"}'::jsonb,
 4,
 ARRAY['Chiseled brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 4, 'available', false),

('shams-plate', 'shams wall medallion',
 'Shams means the sun. Radiating chisel-cut ray pattern from a recessed center boss. Catches every direction of light.',
 52000,
 '["/products/pdp-white/shams-plate-pdp-white.webp","/products/shams-plate.webp"]'::jsonb,
 'Wall Decor',
 '{"diameter":"17in","depth":"1.25in"}'::jsonb,
 5,
 ARRAY['Chiseled brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', false),

('riad-plate', 'riad wall medallion',
 'Riad is the courtyard at the heart of the house. Quartered geometric pattern around a central rosette. The smaller of the medallions.',
 42000,
 '["/products/pdp-white/riad-plate-pdp-white.webp","/products/riad-plate.webp"]'::jsonb,
 'Wall Decor',
 '{"diameter":"14in","depth":"1.25in"}'::jsonb,
 3,
 ARRAY['Chiseled brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 5, 'available', false),

('tarsi-plate', 'tarsi wall medallion',
 'Tarsi is the inlay technique. Mixed copper-and-brass field arranged in concentric pinstripes around a chiseled core.',
 39000,
 '["/products/pdp-white/tarsi-plate-pdp-white.webp","/products/tarsi-plate.webp"]'::jsonb,
 'Wall Decor',
 '{"diameter":"15in","depth":"1.25in"}'::jsonb,
 4,
 ARRAY['Brass','Copper','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 4, 'available', false),

------------------------------------------------------------------------
-- VESSELS (5 SKUs) — Vessels
------------------------------------------------------------------------

('jarra-vessel', 'jarra urn',
 'Tall brass urn, narrow neck, broad shoulder. Jarra is the household jar. Hammered finish, deep tonal range from gold to bronze.',
 62000,
 '["/products/pdp-white/jarra-vessel-pdp-white.webp","/products/jarra-vessel.webp"]'::jsonb,
 'Vessels',
 '{"diameter":"10in","height":"18in"}'::jsonb,
 7,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 3, 'available', true),

('sandouq-vessel', 'sandouq chest',
 'Brass-clad chest with hand-engraved geometric panels. Sandouq is the wedding chest. Lifts on a hidden hinge.',
 88000,
 '["/products/pdp-white/sandouq-vessel-pdp-white.webp","/products/sandouq-vessel.webp"]'::jsonb,
 'Vessels',
 '{"width":"16in","height":"10in","depth":"10in"}'::jsonb,
 14,
 ARRAY['Brass','Hardwood core','Engraved'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 2, 'available', false),

('kasr-vessel', 'kasr vessel',
 'Kasr means palace. Wide-mouthed brass vessel with chiseled architectural register around the body. Useful or decorative.',
 48000,
 '["/products/pdp-white/kasr-vessel-pdp-white.webp","/products/kasr-vessel.webp"]'::jsonb,
 'Vessels',
 '{"diameter":"11in","height":"9in"}'::jsonb,
 5,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 4, 'available', false),

('ibriq-vessel', 'ibriq tea pitcher',
 'Copper body, brass spout, brass handle. Ibriq is the household tea kettle. Functional; also reads as table sculpture.',
 29500,
 '["/products/pdp-white/ibriq-vessel-pdp-white.webp","/products/ibriq-vessel.webp"]'::jsonb,
 'Vessels',
 '{"diameter":"6in","height":"10in"}'::jsonb,
 2,
 ARRAY['Hand-raised copper','Brass'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 8, 'available', false),

('tazza-vessel', 'tazza footed tray',
 'Footed brass tray on a turned pedestal. Tazza is the offering bowl. Serves olives, holds a candle, lives on a console.',
 38500,
 '["/products/pdp-white/tazza-vessel-pdp-white.webp","/products/tazza-vessel.webp"]'::jsonb,
 'Vessels',
 '{"diameter":"10in","height":"5in"}'::jsonb,
 3,
 ARRAY['Hand-hammered brass','Lacquered finish'],
 '9b38c7bf-140c-4317-82a8-ae4e8c52befc', 5, 'available', false);

------------------------------------------------------------------------
-- Verify
------------------------------------------------------------------------
SELECT category, count(*) FROM products GROUP BY category ORDER BY category;
