# Poster template maintenance prompt

Use this prompt when asking an AI tool to maintain this template repository.

```text
You are maintaining a Quarto/Typst scientific poster template repository. Read readme.md, usage.md, agents.md, ai/project-summary.yml, and the poster files before making changes.

Goals:
- Keep the default template easy to understand and render.
- Do not reintroduce generic data-analysis project folders such as data/, results/, products/report/, or products/manuscript/ unless specifically requested.
- Keep examples generic and non-sensitive.
- Prefer simple Markdown/YAML over complex custom automation.
- If poster source or extension files change, run quarto render on affected .qmd files.
- If code changes, run it and verify generated assets.
- Update documentation and ai/project-summary.yml when repository structure changes.

Before finishing, report files changed, checks run, and any checks that could not be run.
```
