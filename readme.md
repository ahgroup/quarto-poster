# Quarto scientific poster template

This repository provides a reusable Quarto template for scientific conference posters. It is based on the official Quarto Typst poster extension and adds a simpler starting document, group-friendly documentation, example figure generation, and AI-use guidance.

The main goal is to let a user write a polished poster in Markdown/Quarto, render a print-ready PDF, and keep the source files version controlled.

## Quick start

### Create a new poster from this GitHub template

If this repository is published as a Quarto template, start a new poster project with:

```sh
quarto use template ahgroup/quarto-poster
```

Then edit the generated `.qmd` file and render it:

```sh
quarto render your-poster.qmd
```

### Use this repository directly

To preview the template in this repository:

```sh
quarto render template.qmd
```

The rendered output is `template.pdf`.

## What this template includes

- `template.qmd`: the main landscape poster template.
- `examples/portrait-poster.qmd`: a portrait-format example.
- `_extensions/poster/`: the official Quarto Typst poster extension vendored into the template so posters render without an extra setup step.
- `figures/`: the full-width header banner, placeholder logos/QR code, and example figures used by the poster examples.
- `code/make-example-figure.r`: optional base-R script that regenerates the example SVG figure.
- `usage.md`: practical instructions for editing, rendering, and adapting posters.
- `ai/`: AI-use policy, reusable prompt templates, and AI-oriented project summary.
- `agents.md`: instructions for AI coding assistants maintaining this template.

## Requirements

Install [Quarto](https://quarto.org/) version 1.9.18 or newer. Quarto includes the Typst engine needed for PDF output.

Optional:

- R, if you want to run `code/make-example-figure.r` or add R code chunks to a poster.
- Positron, VS Code, RStudio, or another editor for editing Quarto files.
- A reference manager such as Zotero with Better BibTeX if you add citations.

## Basic poster workflow

1. Edit the YAML at the top of the poster file: title, authors, affiliation, size, logos, footer text, and keywords.
2. Replace the example sections with your poster content.
3. Put static images, banner artwork, logos, and QR codes in `figures/` or another documented folder.
4. Generate analysis figures from code when possible, then insert the resulting image files into the poster.
5. Render with `quarto render`.
6. Open the PDF and check physical size, fonts, figure resolution, spacing, and margins before printing.

## Design guidance

A scientific poster should usually have one dominant message. Prefer:

- a short title and clear author block;
- one large takeaway or result box;
- fewer words than a paper or slide deck;
- large, readable figures;
- high contrast colors;
- vector graphics such as SVG or PDF when possible;
- a QR code or short URL for the paper, preprint, repository, or contact page.

## License and provenance

This repository is MIT licensed; see `license.md`.

The included Quarto poster extension in `_extensions/poster/` comes from the official Quarto Typst templates project, which publishes those formats under CC0/public-domain terms. See the upstream project: <https://github.com/quarto-ext/typst-templates/tree/main/poster>.
