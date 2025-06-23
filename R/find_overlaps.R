library(dplyr)
library(purrr)

find_peptide_binder_overlaps <- function(df, threshold = 0.5) {
  binder_cols <- grep("^P\\d{2}$", names(df), value = TRUE)
  
  df %>%
    rowwise() %>%
    mutate(n_binders = sum(c_across(all_of(binder_cols)) >= threshold)) %>%
    ungroup() %>%
    filter(n_binders > 1) %>%
    select(peptide, Genes, all_of(binder_cols), n_binders)
}
