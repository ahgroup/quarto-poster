# agents.md

This repository is a Quarto template for scientific conference posters. It is not a data-analysis project, even though it was initially created from a data-analysis template. Maintain it as a reusable poster-template repository.

These instructions are for AI coding agents and human users who want to understand how AI tools should work here.

## Project goals

- Provide an easy-to-use Quarto/Typst scientific poster template.
- Keep the template small, readable, and beginner-friendly.
- Make the default poster render successfully with Quarto.
- Preserve useful AI documentation from the original template, but remove data-analysis project remnants.
- Keep content generic enough for many research groups while including clear examples.

## Repository structure

- `readme.md`: human-facing overview and quick start.
- `usage.md`: practical instructions for editing and rendering posters.
- `starter-poster.qmd`: single starter poster source used both as an example and as the file users edit for their own poster.
- `_extensions/poster/`: vendored official Quarto Typst poster extension.
- `figures/`: example figures, logos, and QR-code placeholders used by examples.
- `code/`: optional code that generates example figures or other template assets.
- `assets/`: static supporting material that is not a poster figure.
- `ai/`: AI workflow notes, prompt templates, AI-use policy, AI-use log, and AI-oriented project summary.
- `code-guidelines.md`: lightweight guidance for code included in this template.
- `license.md`: license for this template repository.

## Core rules

- Do not recreate the old MDS/data-analysis project structure unless the user explicitly asks.
- Keep the default poster renderable without private data, credentials, or machine-specific paths.
- Do not add large data files, raw-data examples, manuscript/report products, or generated analysis outputs unless they directly support the poster template.
- Keep filenames lower-case and descriptive, with words separated by hyphens.
- Prefer simple Markdown and YAML over elaborate custom filters or fragile automation.
- If changing `starter-poster.qmd` or extension files, render the affected poster before reporting success.
- If changing optional code in `code/`, run it and confirm generated outputs are updated.
- Fix obvious small typos/errors encountered and report what was fixed. Flag unclear or larger issues without guessing.

## Quarto/Typst extension notes

The poster format is provided by `_extensions/poster/`, copied from the official Quarto Typst poster template. Keep local customizations minimal unless there is a clear need. When updating the vendored extension, document the upstream source and verify that `starter-poster.qmd` still renders.

## AI assistance documentation

AI-related files have different expected readers and writers:

- `ai/prompts/`: reusable prompt templates that humans or AI tools may read/copy/apply when explicitly pointed to them.
- `ai/project-summary.yml`: concise AI-readable summary. Human-facing docs are authoritative if they disagree.
- `ai/readme-ai.md` and `ai/ai-use-policy.md`: human-facing AI guidance files.
- `ai/ai-use-log.md`: transparency record written by AI tools when meaningful project-specific AI assistance occurs.

## Review expectations

Before handing work back:

- Render affected Quarto poster files.
- Review `git status --short` and ensure changes are intentional.
- Confirm no old data-analysis example files were reintroduced.
- Confirm no private data, credentials, local absolute paths, or unnecessary generated files were added.
- Mention checks that could not be run.

## Git commit and push suggestions

When a coherent set of changes is complete, create a local commit with a concise message that starts with `AI: `. Do not push automatically unless the user explicitly asks for a push.
