#!/usr/bin/env Rscript

library(optparse)
library(readr)
source("R/load_data.R")
source("R/find_overlaps.R")
source("R/visualize.R")

option_list <- list(
  make_option(c("-i", "--input"), type="character", help="Input TSV file"),
  make_option(c("-o", "--output"), type="character", help="Output folder", default = "results/")
)
opt <- parse_args(OptionParser(option_list = option_list))
dir.create(opt$output, showWarnings = FALSE)

df <- load_ms_data(opt$input)
overlaps <- find_peptide_binder_overlaps(df)
write_csv(overlaps, file.path(opt$output, "overlapping_binders.csv"))

g <- plot_overlap_heatmap(overlaps)
ggsave(file.path(opt$output, "overlap_heatmap.png"), plot = g, width = 10, height = 8)
