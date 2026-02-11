cat <<'EOF' > AI_USAGE.md
# AI Usage Documentation — ECN372 HW1

I used AI assistance (ChatGPT via Cursor) during this assignment to support debugging,
code organization, and understanding ggplot2 and tidyverse workflows. All final code
was reviewed, edited, and run by me.

## Description of AI assistance

AI was used for the following purposes:

- Debugging R errors related to ggplot syntax, dplyr pipelines, and file paths
- Helping structure a reproducible project with a single entry-point script
- Suggesting ggplot2 layers (e.g., ribbons, trend lines) based on the assignment description
- Explaining terminal commands for creating files and running scripts

AI was **not** used to generate final results without my understanding, and no code
was copied without modification or verification. All figures were produced by running
the final script locally using R.

## Verification and responsibility

I verified that all code runs correctly on my machine using a single terminal command
(`Rscript scripts/02_make_figures.R`) and produces the required output files in the
`output/` directory. I take full responsibility for the correctness and reproducibility
of the submitted work.

EOF
