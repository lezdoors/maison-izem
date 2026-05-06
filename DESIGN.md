---
version: alpha
name: Perle de l'Atlas
description: Dark luxury e-commerce for handcrafted Moroccan objects. The visual language evokes an old medina workshop — low light, raw materials, brass warmth against deep ink.
colors:
  # Darks — background hierarchy
  ink: "#0A0807"
  night: "#0F0C0A"
  espresso: "#171210"
  graphite: "#221A16"
  coal: "#2E241E"
  stone: "#3A2F28"

  # Brass — accent, CTAs, focus
  primary: "#C9A24A"
  brass: "#C9A24A"
  brass-hi: "#E8D49A"
  brass-lo: "#8A6C2D"
  gold-ink: "#4A3918"

  # Neutrals — text hierarchy
  bone: "#EDE4CF"
  parchment: "#D9CEB2"
  oyster: "#B7A988"
  dim: "#877A63"
  mute: "#5A4F40"

  # Signal
  lacquer: "#7A1B15"

typography:
  h1:
    fontFamily: Cormorant Garamond
    fontSize: 120px
    fontWeight: 300
    lineHeight: 0.92
    letterSpacing: -0.02em
  h2:
    fontFamily: Cormorant Garamond
    fontSize: 72px
    fontWeight: 300
    lineHeight: 1
    letterSpacing: -0.02em
  h3:
    fontFamily: Cormorant Garamond
    fontSize: 44px
    fontWeight: 300
    lineHeight: 1
    letterSpacing: -0.015em
  body:
    fontFamily: Inter Tight
    fontSize: 16px
    fontWeight: 300
    lineHeight: 1.8
  lede:
    fontFamily: Cormorant Garamond
    fontSize: 19px
    fontWeight: 300
    lineHeight: 1.55
  eyebrow:
    fontFamily: JetBrains Mono
    fontSize: 10px
    fontWeight: 400
    lineHeight: 1.4
    letterSpacing: 0.28em
  mono:
    fontFamily: JetBrains Mono
    fontSize: 11px
    fontWeight: 400
    lineHeight: 1.5
    letterSpacing: 0.22em
  price:
    fontFamily: Cormorant Garamond
    fontSize: 32px
    fontWeight: 300
    lineHeight: 1
  button:
    fontFamily: JetBrains Mono
    fontSize: 11px
    fontWeight: 400
    lineHeight: 1
    letterSpacing: 0.24em
  card-title:
    fontFamily: Cormorant Garamond
    fontSize: 22px
    fontWeight: 300
    lineHeight: 1.15
    letterSpacing: -0.005em
  card-price:
    fontFamily: JetBrains Mono
    fontSize: 12px
    fontWeight: 400
    lineHeight: 1
    letterSpacing: 0.1em
  nav:
    fontFamily: JetBrains Mono
    fontSize: 10.5px
    fontWeight: 400
    lineHeight: 1
    letterSpacing: 0.18em

spacing:
  xs: 8px
  sm: 14px
  md: 24px
  lg: 48px
  xl: 72px
  xxl: 120px
  section: 140px
  page-gutter: 48px
  page-gutter-mobile: 20px
  max-width: 1440px

rounded:
  none: 0px

components:
  button-solid:
    backgroundColor: "{colors.brass}"
    textColor: "{colors.ink}"
    typography: "{typography.button}"
    padding: "14px 20px"
  button-ghost:
    backgroundColor: transparent
    textColor: "{colors.bone}"
    typography: "{typography.button}"
    padding: "14px 20px"
  card:
    backgroundColor: "{colors.espresso}"
    typography: "{typography.card-title}"
    padding: "0"
  eyebrow:
    textColor: "{colors.brass}"
    typography: "{typography.eyebrow}"
  nav:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.bone}"
    typography: "{typography.nav}"
---

# Perle de l'Atlas Design System

## Overview

Perle de l'Atlas is a luxury e-commerce catalogue for handcrafted Moroccan objects — brass, bone, leather, cedar, plaster, lacquer. The visual identity channels the atmosphere of a dimly lit riad workshop: raw brass catching lamplight against ink-dark walls, dust motes in warm air, parchment ledgers.

**Mood**: Quiet opulence. Not flashy or maximalist. The luxury reads through restraint — generous whitespace, unhurried typography, and a muted palette punctuated only by warm brass.

**Target**: Design-conscious buyers, 30-55, who appreciate provenance, craft, and the story behind an object. They shop slowly and deliberately.

**Voice**: Measured, poetic, precise. Short sentences. Never salesy. Titles in lowercase. The brand speaks like a curator, not a retailer.

## Colors

The palette draws from the materials themselves — ink from charcoal, brass from the metal, bone from inlay, parchment from aged paper, lacquer from oxblood resin.

### Backgrounds

Six dark values create depth without contrast fatigue. `ink` (#0A0807) is the deepest — page body, hero overlays. `night` (#0F0C0A) provides the secondary surface for alternating sections. `espresso` through `stone` are used for cards, containers, and interactive states.

### Brass accent

The entire accent system is brass. `brass` (#C9A24A) is the primary — CTAs, active states, eyebrow labels, dividers. `brass-hi` (#E8D49A) for prices and hover highlights. `brass-lo` (#8A6C2D) for muted accents. No other accent colors exist; this single-hue constraint is intentional.

### Text hierarchy

`bone` (#EDE4CF) for headings and primary text. `parchment` (#D9CEB2) for body copy and subtitles. `oyster` and `dim` for secondary labels and metadata. `mute` for the quietest elements.

### Lines and dividers

Lines use bone at very low alpha — `rgba(237,228,207,0.12)` for standard dividers, `0.06` for soft separators, `0.22` for bone emphasis. Brass lines at `rgba(201,162,74,0.5)` for accent dividers (price rows, section borders).

### Signal

`lacquer` (#7A1B15) is reserved for destructive actions and error states only. It references the oxblood lacquer used in Moroccan woodwork.

## Typography

Three typeface families, each with a clear role:

### Cormorant Garamond (serif)

The display and headline face. Always weight 300 (light). Used for: page titles, section headlines, product names, prices, body lede text, footer logotype. Italic brass for emphasis within headings (`<em>` tags). The lightness and high x-height give it elegance without fragility.

Clamp sizing for responsive: headings scale from mobile min to desktop max (e.g., `clamp(48px, 8vw, 120px)` for h1).

### Inter Tight (sans-serif)

Body text only. Weight 300. Never used for headings, labels, or navigation. Clean and stays out of the way.

### JetBrains Mono (monospace)

The workhorse for UI elements: navigation, eyebrow labels, breadcrumbs, buttons, prices (small), filters, metadata, footer columns. Always uppercase with wide letter-spacing (0.18em-0.28em). Size 9-11px. This creates the "catalogue" feel — technical, precise, archival.

### Arabic support

Noto Naskh Arabic replaces both serif and mono faces when `lang="ar"`. Letter-spacing reduces to 0.06em for Arabic monospace contexts.

## Layout

### Grid

Max-width 1440px, centered. Page gutters: 48px desktop, 20px mobile. Product grid is 4 columns on desktop, 3 on tablet, 2 on mobile, 1 on narrow.

### Section rhythm

Sections alternate between `ink` and `night` backgrounds to create visual breathing. Generous vertical padding: 120-140px desktop, 60-80px mobile. Each section is bordered top with a 1px `line` divider.

### Aspect ratios

Product cards: 4:5 (portrait). Lifestyle images: 16:9 (wide), 1:1 (square), 3:5 (tall portrait). Hero: full viewport height.

### Breakpoints

- 1280px: nav link spacing tightens
- 1000px: hamburger menu appears, grids collapse
- 900px: 2-column layouts become single column
- 600px: final mobile adjustments
- 500px: single-column product grid

## Elevation & Depth

No box shadows. Depth is created through:

1. **Layered gradients**: Radial warm-light gradients (brass at low opacity) create the illusion of lamplight on surfaces. Dark vignettes (radial-gradient to rgba(0,0,0,0.55)) frame content.
2. **Background blur**: Nav uses `backdrop-filter: blur(14px)` with semi-transparent ink background when scrolled.
3. **Film grain**: A fixed SVG noise overlay (fractalNoise, opacity 0.22, overlay blend mode) covers the entire viewport. This is crucial to the tactile, analog feel.
4. **Vignette**: A fixed radial gradient darkens edges of the viewport, focusing attention center.

## Shapes

No border-radius anywhere. All corners are sharp. This is a hard rule — it reinforces the architectural, workshop quality. Even buttons are rectangular.

Cards and images use 1px solid borders in `line` color. Some images get a nested inner border (14px inset) in `line-brass` to create a frame-within-frame effect.

## Components

### Buttons

Three variants, all monospace uppercase:

- **Solid**: Brass background, ink text. Hover: brass-hi background. The primary CTA.
- **Ghost**: Transparent background, bone text, line border. Hover: bone fill, ink text. Secondary actions.
- **Link-underline**: Brass text with 1px brass bottom border. Arrow animates wider on hover. Tertiary/inline.

All buttons include an animated arrow element — a 24px line with a 6px chevron tip, expanding to 36px on hover.

### Cards (Product)

4:5 aspect-ratio image container with espresso background and line border. Warm radial gradient overlay simulates lamplight. Image hover: scale(1.07) with crossfade to alternate image if available. Category label in top-left (brass mono on dark blur backdrop). Quick-add button fades in at bottom-right on hover.

Below the image: product name (serif 22px) left-aligned, price (mono 12px brass-hi) right-aligned, separated by a soft top border.

### Eyebrow

Mono 10px, brass, uppercase, 0.28em letter-spacing. Preceded by a 28px horizontal brass line. Used to label sections.

### Navigation

Fixed top, transparent on load, glass-morphism on scroll (ink at 78% opacity + blur). Brand logotype left (Cormorant Garamond 24px, "Atlas" in bone, "Perle" in italic brass). Links center in monospace. Cart button right with brass border and count badge.

Mobile: hamburger icon (animated three-line to X), full-screen drawer with serif links and language switcher.

### Reveal animations

Content enters with `opacity: 0` and `translateY(22px)`, transitioning to visible over 1.2s with a custom cubic-bezier ease. Elements stagger by 80-100ms delay. Word-reveal variant: each word slides up from a clipped overflow container.

### Ticker

Horizontal scrolling marquee of discipline names (serif italic 32px, parchment). Items separated by brass star glyphs. Infinite linear animation at 48s cycle.

## Do's and Don'ts

### Do

- Use generous vertical space between sections (120px+)
- Keep eyebrow labels to 2-4 words maximum
- Use brass as the ONLY accent color
- Let images breathe inside their borders — never crop too tight
- Keep button text to 3-4 words
- Use serif italic for any word meant to feel warm or human
- Maintain the grain overlay on every page

### Don't

- Never use border-radius on any element
- Never introduce a second accent color (no blue, green, red CTAs)
- Never use font weights above 500 for serif text
- Don't stack more than 2 eyebrow labels in the same viewport
- Don't use sans-serif (Inter Tight) for headings or labels
- Don't remove the film grain or vignette overlays
- Don't use emoji anywhere in the interface
- Don't use card shadows — use borders and gradients only
