cat <<'EOF' > README.md
# ECN372 — Homework 1

This repository replicates two figures from the Gapminder dataset as part of ECN372 Homework 1.  
The goal of the assignment is to practice tidyverse-style data manipulation, ggplot2 visualization,
and reproducible computing workflows.

## Repository structure

- `scripts/`
  - `02_make_figures.R`: Main entry point. Generates all figures.
- `output/`
  - `figure-1-bubble-trends.pdf`
  - `figure-2-ribbon-median-weighted.pdf`
- `README.md`: Project description and replication instructions
- `AI_USAGE.md`: Documentation of AI assistance used

## How to reproduce the results

From the root of the repository, run the following command in the terminal:

```bash
Rscript scripts/02_make_figures.R
