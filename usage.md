# Usage

This file explains how to create and render a scientific poster from this Quarto template.

## Before you start

Work from the repository root. In Positron, open this repository as a folder/project. Other editors such as VS Code or RStudio are also fine.

Required software:

- Quarto 1.9.18 or newer.

Optional software:

- R, Python, or Julia if your poster generates figures or tables from code.
- A reference manager if you add citations.

Check Quarto with:

```sh
quarto --version
```

## Render the main example

From the repository root, run:

```sh
quarto render starter-poster.qmd
```

This creates `starter-poster.pdf`.

## Create a new poster from the template

From a folder where you want the new poster project to be created, run:

```sh
quarto use template ahgroup/quarto-poster
```

Quarto will copy the template files and the poster extension into the new folder. Edit the generated `.qmd` file and render it with `quarto render`.

## Edit poster metadata

At the top of the poster file, edit the YAML block. Common fields are:

- `title`: poster title.
- `poster-authors`: author line shown below the title.
- `departments`: affiliation line.
- `poster-banner`: path to the full-width header/banner image, such as `figures/poster-banner.svg`. For posters in subfolders, use a relative path from the poster source file, such as `../figures/poster-banner.svg`.
- `footer-text`: conference, location, date, or funding note.
- `footer-url`: project, preprint, paper, or repository URL.
- `footer-emails`: contact email address or addresses.
- `keywords`: short tags shown near the top of the poster.
- `size`: physical poster size in inches, such as `48x36` or `36x48`.
- `num-columns`: number of body columns.

## Edit poster content

The poster body is ordinary Quarto/Markdown. Level-1 headings become red section bars, and level-2 headings become smaller subsection labels. Keep sections short and visual.

Recommended sections for a standard scientific poster:

- Background or Motivation
- Objective or Research Question
- Methods
- Results
- Key Takeaway
- Conclusions
- Acknowledgements / Funding / Contact

## Figures and tables

Use vector graphics such as SVG or PDF whenever possible. PNG files can work if they are high resolution.

Example result figures are included in `figures/example-results.svg` and `figures/example-model-estimates.svg`. They can be regenerated with:

```sh
Rscript code/make-example-figure.r
```

If your poster has real analysis code, keep code and generated figures synchronized. Commit small non-sensitive figures when doing so helps others render the poster. Do not commit sensitive, restricted, or very large data/output files.

## Final checks before printing

Before sending a poster to a printer or conference system:

- Confirm the PDF page size matches the required poster size.
- Zoom in and check that text and figures remain sharp.
- Check title, author names, affiliations, acknowledgements, funding, and contact information.
- Check spelling, figure legends, axis labels, and units.
- Verify QR codes and URLs.
- Confirm all reused logos, figures, and references are allowed to appear on the poster.

## AI-assisted editing

AI tools can help revise wording, check layout, create example code, and review for reproducibility. Human users remain responsible for scientific accuracy, authorship, citation accuracy, privacy, and final poster approval. See `ai/ai-use-policy.md` and `agents.md` for details.
