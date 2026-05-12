# Maison Izem — Project Instructions

## Brand Identity

Maison Izem is a **luxury editorial brand** that sources directly from Moroccan artisan workshops. The positioning is closer to RH, Soho Home, Apparatus, and Artemest than to any Moroccan marketplace or decor catalog.

**Core line**: "Objects drawn from the medina."

### What we are NOT
- A Moroccan marketplace or souvenir shop
- A dropshipping decor store
- A cheap artisan catalog
- A template Shopify store

### What we ARE
- A luxury cultural house
- An editorial archive of curated objects
- A catalogue, not a store
- A bridge between Moroccan master craftsmanship and the US luxury interiors market

### Market validation
- Our lighting suppliers in Marrakech also supply TAZI Designs (successful US luxury Moroccan export brand)
- The US luxury market already exists for this category at premium pricing ($350 poufs, $450 sconces, $1,500 side tables, $900+ pendants)
- The differentiator is presentation, branding, curation, photography, atmosphere, trust, and positioning

### What the customer is buying
Not metal, leather, wood, or brass. They are buying:
- Atmosphere, craftsmanship, identity, story
- Curation, exclusivity, emotional projection
- The feeling of "objects drawn from the medina"

## Design Principles

## Visual direction (locked 2026-05-11 — supersedes prior "dim riad / brass-only" brief)

**Two coexisting visual modes:**

### Mode 1 — White commerce shell (homepage, collection, PDP, cart, checkout)
The selling surface. Roche-Bobois × Anthropologie × Pierre Yovanovitch Marrakech.

- **Background**: pure white #FFFFFF for product PDP cyclorama shots, ivory/off-white for category pages
- **Hero / lifestyle**: bright contemporary architecture (white plastered walls, pale oak floor, steel-mullioned windows, double-height ceilings) hosting richly-colored Moroccan craft as anchor
- **Saturated jewel-tone palette**: majorelle blue, deep emerald, saffron yellow, terracotta, magenta — accepted and encouraged as room accents
- **Light**: BRIGHT diffuse natural daylight. NOT golden hour, NOT candlelit, NOT dim
- **Composition**: maximalist Moroccan craft inside RB-Mah-Jong architectural spaciousness — colorful pieces breathe in generous negative space
- **References**: roche-bobois.com (Mah Jong sectional installations), YSL Marrakech / Jardin Majorelle, Royal Mansour suites, Pierre Yovanovitch Marrakech projects, Studio KO architecture

### Mode 2 — Dark editorial gallery (`/atelier` route)
The brand storytelling wing. Embedded as a featured section on the white homepage AND as a standalone deep-link.

- **Background**: deep ink/night palette (existing dark site tokens)
- **Mood**: dimly lit, candlelit, warm brass reflections, riad atmosphere, mashrabiya shadows
- **Use**: editorial features, "the house" story, atelier/maalem narratives, behind-the-scenes
- **References**: Architectural Digest editorial spreads, boutique riads at dusk, RH Source Book

### Hard rules (apply to both modes)
- No border-radius anywhere
- No box shadows (use borders and gradients)
- No emoji in the interface
- No cheap gradients/glows
- No generic ecommerce widgets ("Buy 2 get 1 free" banners, blinking sale tags)
- No "template" feeling
- No overcrowded UI or loud souk-style bazaar aesthetics
- No aggressive sales tactics
- If something feels even slightly mass-market or generic, simplify it or remove it
- One cheap-looking component can collapse luxury perception — consistency matters more than features

### Mode-specific color rules
- **White mode**: saturated Moroccan jewel tones (cobalt, emerald, saffron, terracotta) are encouraged in lifestyle photography. UI itself stays neutral (ivory bg, charcoal type, brass-only UI accents — no rainbow buttons)
- **Dark mode**: brass-only accent (existing). No jewel tones in UI; saturation lives in lifestyle imagery only.

### Design specifics
- Fewer products visible at once, larger imagery
- Stronger typography, more whitespace, slower pacing
- Cinematic transitions, immersive sections
- Environmental photography, product-in-context storytelling — but always anchored in modern architecture, never a dressed Moroccan film set
- Objects should feel architectural and atmospheric

### Photography directive (for any AI image generation)
- PDP primary product shots → pure white seamless cyclorama, soft diffuse overhead fill, 3/4 angle, no harsh shadows
- Lifestyle / hero → bright contemporary room (RB/RH architecture) with saturated Moroccan accent piece(s) and jewel-tone color anchors
- Macro / detail → tight, abstract, almost graphic — RB/Apparatus aesthetic
- NEVER generate: dim candlelit interiors, golden-hour orange wash, mashrabiya screens dominating the frame, zellige-tiled floors as primary surface, supplier-shop backgrounds (plastic wrap, motorbikes, dirt alleys), maalem hands as the focal point (those belong in the dark `/atelier` editorial only)
- Hero direction reference (Hero A, locked 2026-05-11): emerald velvet sofa, majorelle blue accent wall, octagonal MOP coffee table, perforated brass pendant overhead, saffron+terracotta kilim, olive tree in terracotta pot, steel-mullioned French doors with sheer linen, bright cool daylight from both sides. File: `media/hero/raw/hero-emerald-majorelle-poster-4k.png`

## Product Strategy

### Tier 1 — Scalable ecommerce (reliable revenue)
Lighting, sconces, poufs, cushions, mirrors, smaller decor. Easier to ship, repeatable.

### Tier 2 — Statement objects (prestige + designer attraction)
Artisan tables, bone inlay furniture, large handcrafted pieces. Elevate the brand, attract interior designers.

### Pricing
Luxury pricing is intentional. Low pricing hurts perception. A handcrafted side table at $1,499 feels more believable than $299 in this context. The brand experience justifies the value.

## Technical Stack

- **Frontend**: React 18 via CDN + Babel standalone (no build step). Each page is a standalone HTML file with inline `<script type="text/babel">`
- **Styling**: Vanilla CSS with custom properties (see DESIGN.md for tokens)
- **Data**: Supabase (project: `unsenfjlqqqjibbnbpur`)
- **Payments**: Stripe (test mode)
- **Email**: Resend
- **Hosting**: Vercel (auto-deploy from GitHub `lezdoors/atlas-dark`)
- **Domains**: maisonizem.com (purchased 2026-05-10 via Vercel registrar, attached to atlas-dark project), www.maisonizem.com, atlas-dark.vercel.app (preview)

### Key technical patterns
- `shared.js` exports components via `window` (Nav, Footer, CartBadge, Reveal, WordReveal, LangProvider, etc.)
- Cart uses localStorage (key: `perle-cart`), dispatches `cart-updated` events
- Product images stored in Supabase, served via Vercel rewrite (`/products/:path*` -> `/media/products/:path*`)
- Edge functions: create-checkout, stripe-webhook, create-order, get-order, admin-auth
- i18n: English, French, Arabic (RTL supported)

### File structure
- `index.html` — Landing page (hero, ticker, featured, gallery, brand story, provenance, services)
- `collection.html` — Product grid with category filters
- `product.html` — Product detail page (gallery, specs, add-to-cart, related)
- `about.html` — Brand story and craftsmen profiles
- `cart.html` — Shopping cart and checkout
- `success.html` — Order confirmation
- `shared.js` — Shared React components and i18n
- `supabase-client.js` — Supabase REST client (SB namespace)
- `cart.js` — localStorage cart logic (Cart namespace)
- `styles.css` — All styling with CSS custom properties
- `DESIGN.md` — Design system tokens and rationale

### Development
- `vercel.json`: cleanUrls, no trailing slashes, product image rewrites
- No build step needed — edit HTML/JS/CSS files directly
- Push to `main` branch triggers Vercel deployment

## Content Voice

Measured, poetic, precise. Short sentences. Never salesy. Titles in lowercase. The brand speaks like a curator, not a retailer.

## Important Context

- Supplier photography from Morocco may look rough — our role is transforming craftsmanship into a premium emotional experience through art direction, staging, typography, layout, and storytelling
- This is the actual business: the presentation layer
- Ultra-clean mobile UX is critical
- Every technical change must serve the luxury perception
