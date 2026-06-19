# AI-use log

This file records meaningful AI-assisted work on this repository. Entries should be short text sections, not full transcripts.

## 2026-06-18 — Converted data-analysis starter repo into poster-template repo

AI assistance helped remove MDS/data-analysis template remnants, add Quarto/Typst poster template files, adapt documentation, create example figure assets, and verify rendering. Human review is still needed for final design preferences and branding.

## 2026-06-18 — Fixed header logo path handling

AI assistance updated the bundled Typst/Quarto poster extension so `institution-logo` paths are resolved from the poster source file instead of the vendored Typst package. The default header logo can now live in `figures/logo-placeholder.svg`, and the portrait example uses `../figures/logo-placeholder.svg`. Checks included rendering the main and portrait posters and creating/rendering a fresh poster project with `quarto use template`.

## 2026-06-18 — Updated default visual design

AI assistance revised the default poster layout to use a full-width banner-style header with centered title, author, and affiliation text, inspired by the PhysMed Quarto poster template. The example now uses `poster-banner` instead of `institution-logo`, with banner artwork stored in `figures/poster-banner.svg`. Checks included rendering the main and portrait posters and creating/rendering a fresh poster project with `quarto use template`.

## 2026-06-18 — Simplified to one starter poster

AI assistance replaced the separate `template.qmd` plus `examples/` layout with a single root-level `starter-poster.qmd`, then revised the starter poster again to closely recreate the John immune priming poster layout and content at `john-immune-priming-project/products/poster`. The starter now uses the original-style UGA header, red section bars, three main content regions, original extracted/cropped figure assets, introduction/methods/discussion/reference text, and no auto-generated poster filename.
