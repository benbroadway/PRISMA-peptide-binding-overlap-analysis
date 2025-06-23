### `R/load_data.R`

```r
library(readr)
library(dplyr)

load_ms_data <- function(filepath) {
  df <- read_tsv(filepath, col_types = cols(.default = col_character()))
  # Convert numeric binder columns to numeric
  binder_cols <- grep("^P\\d{2}$", names(df), value = TRUE)
  df <- df %>%
    mutate(across(all_of(binder_cols), ~ as.numeric(.x))) %>%
    replace(is.na(.), 0)
  df
}


