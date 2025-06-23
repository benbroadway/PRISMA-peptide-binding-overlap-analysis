# PRISMA-peptide-binding-overlap-analysis
R script to test for consecutive binders from PRISMA/MS/peptide binding experiment 

## Project Structure

- `data/`: Input example files
- `R/`: Analysis functions for loading data, finding overlaps, visualization, utils
- `run_analysis.R`: Script to execute full pipeline
- `DESCRIPTION`, `NAMESPACE`: for package structure

## Getting Started

```bash
# Install dependencies
install.packages(c("tidyverse","purrr","readr","writexl","testthat"))

# Run pipeline
Rscript run_analysis.R --input data/example_input.tsv --output results/
