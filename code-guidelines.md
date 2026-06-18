# Code guidelines

This repository should contain only lightweight code that supports the poster template, such as scripts that create example figures or assets.

## Principles

- Keep scripts simple and readable.
- Use project-relative paths.
- Prefer mature, documented dependencies.
- Avoid silent package installation or environment modification.
- Fail clearly when required software or inputs are missing.
- Include useful comments explaining why and how the script works.
- Do not add private data, credentials, local paths, or machine-specific assumptions.

## R examples

For R scripts, prefer base R when it is sufficient for small template assets. If extra packages are needed, document them in `readme.md` and `usage.md`.

Run scripts from the repository root unless the script clearly documents a different working directory.
