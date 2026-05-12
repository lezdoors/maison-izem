# Maison Izem — Shot Readiness Audit (launch checklist)

**Last updated:** 2026-05-11 · **Maintainer:** Turbo

Single source of truth for what shots exist per SKU and what's missing before website + Etsy launch.

## Required shot set per SKU (launch standard)

| # | Shot type | Filename suffix | Purpose | Required for |
|---|-----------|-----------------|---------|--------------|
| 1 | **PDP white** | `-pdp-white.webp` | Primary on pure white seamless cyclorama, 4:5 | Website + Etsy thumbnail |
| 2 | **Editorial context** | `.webp` (flat) | Warm-tadelakt restage, environmental | Website gallery slot 2, Etsy slot 2 |
| 3 | **Macro detail** | `-macro.webp` | Tight crop on craftsmanship (pierce / chisel / surface) | Website slot 3, Etsy slot 3 |
| 4 | **Alt angle** | `-alt-white.webp` | Side or back on white cyclorama, same 4:5 | Website slot 4, Etsy slot 4 |
| 5 | **Lit profile** *(lighting only)* | `-lit.webp` | Light fixture ON, showing cast pattern | Website slot 5, Etsy slot 5 |
| 6 | **Scale shot** | `-scale.webp` | In styled RB-Mah-Jong room with humans 35–60 for scale | Website slot 6, Etsy slot 6 |
| 7 | **Square Etsy thumbnail** | `-etsy-1x1.webp` | 1:1 crop of PDP white | Etsy listing thumbnail |

**Launch minimum:** shots 1–4 (5 for lights) per SKU. Shots 6–7 are post-launch polish.

## Status matrix (2026-05-12 02:35 UTC)

✅ = on disk · ⏳ = generation queued · ❌ = missing

### Pendants (14)
All 14: ✅ PDP · ✅ Editorial · ✅ Macro · ✅ Alt · ✅ Lit · ❌ Scale · ✅ Etsy 1:1

### Lamps (2)
All 2: ✅ PDP · ✅ Editorial · ✅ Macro · ✅ Alt · ✅ Lit · ❌ Scale · ✅ Etsy 1:1

### Sconces (3)
All 3: ✅ PDP · ✅ Editorial · ✅ Macro · ✅ Alt · ✅ Lit · ❌ Scale · ✅ Etsy 1:1

### Lanterns (3)
All 3: ✅ PDP · ✅ Editorial (mishaal pending) · ✅ Macro · ✅ Alt · ✅ Lit · ❌ Scale · ✅ Etsy 1:1

### Wall plates (5) — lit shot not applicable
All 5: ✅ PDP · ✅ Editorial · ✅ Macro · ✅ Alt · — Lit · ❌ Scale · ✅ Etsy 1:1

### Vessels (5) — lit shot not applicable
All 5: ✅ PDP · ✅ Editorial · ✅ Macro · ✅ Alt · — Lit · ❌ Scale · ✅ Etsy 1:1

## Generation budget

| Shot type | Count | Model | Credit cost |
|-----------|-------|-------|-------------|
| Macro detail | 32 | nano_banana_2 (image-to-image) | $0 (free until May 17) |
| Alt angle on white | 32 | nano_banana_2 (image-to-image) | $0 (free until May 17) |
| Lit profile | 22 (lights only) | nano_banana_2 (image-to-image) | $0 (free until May 17) |
| Scale / lifestyle | 32 | nano_banana_2 (image-to-image) | $0 (free until May 17) |
| Etsy 1:1 crop | 32 | cwebp post-process | $0 (no AI) |
| Editorial for mishaal | 1 | nano_banana_2 | $0 |
| **Total launch-essential gens** | **87** | nano_banana_2 unlimited | **$0** |

## Execution order (Turbo)

1. **Apply SQL inserts** (db/seed-pdp-launch.sql via Supabase Dashboard)
2. **Macro shots batch — 32** ← in progress
3. **Alt angle batch — 32**
4. **Lit profile batch — 22**
5. **Scale shots batch — 32**
6. **Etsy 1:1 crops — 32** (cwebp post-process)
7. **Update DB image arrays** to include all new shots
8. **Etsy CSV export** for bulk listing upload

## Etsy launch prep

Etsy supports 10 image slots per listing. Optimal load order:
1. PDP white (square crop = `-etsy-1x1.webp`) — thumbnail
2. PDP white (4:5 original)
3. Editorial / lifestyle context
4. Macro detail
5. Alt angle on white
6. Lit profile (lights only)
7. Scale shot (with human for size reference)
8. (optional) variant macros
