# Read in References
# Purpose: The purpose of this script is to read in the Chattanooga reference files

library(tidyverse)

chat_files <- list.files("references/chattanooga", pattern = ".txt$", full.names = T)

chattanooga_files <- purrr::map(.x = chat_files,
                                .f = read_csv)
