library(ggplot2)
library(tidyr)

plot_overlap_heatmap <- function(overlap_df) {
  binder_cols <- grep("^P\\d{2}$", names(overlap_df), value = TRUE)
  overlap_df %>%
    select(peptide, all_of(binder_cols)) %>%
    pivot_longer(-peptide, names_to = "run", values_to = "intensity") %>%
    ggplot(aes(x = run, y = peptide, fill = intensity > 0)) +
    geom_tile() +
    scale_fill_manual(values = c("white", "steelblue")) +
    theme_minimal() +
    labs(fill = "Binder Present")
}
