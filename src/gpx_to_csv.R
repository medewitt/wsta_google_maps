library(XML)
library(dplyr)
library(purrr)

filename <- "data/routes/route_107.gpx"

gpx <- filename %>%
  xmlTreeParse(useInternalNodes = TRUE) %>%
  xmlRoot %>%
  xmlToList %>%
  (function(x) x$rte) %>%
  (function(x) unlist(x[names(x) == "rtept"], recursive = F)) %>%
  map_df(function(x) as.data.frame(t(unlist(x)), stringsAsFactors=FALSE)) %>% 
  tidyr::fill(V1) %>% 
  filter(!is.na(lat))
