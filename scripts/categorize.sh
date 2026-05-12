#!/bin/bash
# Maison Izem — slug → category resolver.
# Pure function. Given a product filename (basename), prints its category folder.
# Categories: pendants, lamps, sconces, lanterns, wall-plates, vessels, furniture, poufs, small-goods, tagines, ceramics, uncategorized

categorize() {
  local name="$1"
  case "$name" in
    # Lighting — pendants (existing 8 styles + new atelier brand-named line)
    amani-*|amaya-*|chamss-*|chorouk-*|diyae-*|kamar-*|manar-*|omniya-*|oval-pendant-*|spindle-pendant-*|teardrop-pendant-*|noor-pendant.*|hilal-pendant.*|layla-pendant.*|najma-pendant.*|falak-pendant.*|warda-pendant.*|bayt-pendant.*|bayda-pendant.*|qubba-pendant.*|sirage-pendant.*|samar-pendant.*|nadia-pendant.*|zahra-pendant.*|mishkat-pendant.*)
      echo "pendants" ;;
    # Lighting — table lamps (with shade)
    fanous-lamp.*|kandil-lamp.*)
      echo "lamps" ;;
    # Lighting — wall sconces
    diya-sconce.*|manara-sconce.*|minbar-sconce.*)
      echo "sconces" ;;
    # Lighting — lanterns (glass + brass)
    fanar-lantern.*|mishbah-lantern.*)
      echo "lanterns" ;;
    # Decor — wall plates / medallions (NOT dinnerware)
    tabaq-plate.*|khatam-plate.*|shams-plate.*|riad-plate.*|tarsi-plate.*)
      echo "wall-plates" ;;
    # Decor — vessels (urns, jars, kettles, footed plates)
    jarra-vessel.*|sandouq-vessel.*|kasr-vessel.*|ibriq-vessel.*|tazza-vessel.*)
      echo "vessels" ;;
    # Furniture — thrones, dressers, chests, side tables, beds, mirrors, screens, coffee tables
    kursi-*|nakch-*|nekch-*|nacre-*|maalem-octogonale-*|maalem-nesting-*|moroccan-throne-*|moroccan-hammam-*|moroccan-bone-inlay-*|moroccan-mother-of-pearl-*|moroccan-octagonal-coffee-*|moroccan-painted-*|bahut-*|banquette-*|cedre-*|commode-*|gueridon-*|khzana-*|koubba-*|meida-*|miroir-*|moucharabieh-*|sofra-*|tesselle-coffee-*|zellige-table-*)
      echo "furniture" ;;
    # Lamps — table lamps + standalone fanous-style (sphere/globe forms)
    fanous-*)
      echo "lamps" ;;
    # Sconces — wall appliques
    applique-*)
      echo "sconces" ;;
    # Vessels — additional decorative metalware (saqayah brass, objet sculptures)
    saqayah-brass-*|saqayah-cuivre-*|objet-*)
      echo "vessels" ;;
    # Small goods — trays (plateau = tray)
    plateau-*)
      echo "small-goods" ;;
    # Ceramics — additional dinandier subcategories
    dinandier-*)
      echo "ceramics" ;;
    # Poufs — leather, kilim, sabra silk, hachkar
    leather-pouf-*|kilim-pouf-*|sabra-pouf-*|hachkar-*)
      echo "poufs" ;;
    # Small goods — beldi drinkware (Izem's own line)
    beldi-cup-*|beldi-glass-*)
      echo "small-goods" ;;
    # Tagines — cookware
    cooking-tagine-*|mini-tagine-*|traditional-tagine-*|tagine-*|serving-bowl-*)
      echo "tagines" ;;
    # Ceramics — Maison Chapuis line, separate brand
    berber-essence-*|fez-*|safi-*|zagora-*|earth-hues-*|marrakech-bloom-*|majorelle-*|chouara-*|dinandier-laque-*|saqayah-cuivre-*|hanbel-*|editorial-ceramiques-*)
      echo "ceramics" ;;
    *)
      echo "uncategorized" ;;
  esac
}

# When called directly with a filename arg, print the category for that file.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  categorize "$(basename "$1")"
fi
