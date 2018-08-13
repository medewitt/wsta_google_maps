library(XML)
library(dplyr)
library(purrr)

filename <- "data/routes/route_107.gpx"

# Find the Files ----
files <- list.files("data/routes/", pattern = ".gpx$")
shape_names <-files %>% 
  gsub(pattern = "\\D", replacement = "",x = .) %>% 
  as.numeric()

# Execute the Loop ----

gpx <- list()

for( i in seq_along(files)){
  
  filename <- paste0("data/routes/", files[[i]])
  gpx[[i]] <- filename %>%
    xmlTreeParse(useInternalNodes = TRUE) %>%
    xmlRoot %>%
    xmlToList %>%
    (function(x) x$rte) %>%
    (function(x) unlist(x[names(x) == "rtept"], recursive = F)) %>%
    map_df(function(x) as.data.frame(t(unlist(x)), stringsAsFactors=FALSE)) %>% 
    tidyr::fill(V1) %>% 
    filter(!is.na(lat)) %>% 
    rename(shape_pt_lat = lat,
           shape_pt_lon = lon) %>% 
    mutate(shape_pt_sequence = row_number(),
           shape_dist_traveled = NA) %>% 
    mutate(shape_id = shape_names[[i]]) %>% 
    select(-V1)
}

shapes <- bind_rows(gpx) %>% 
  select(shape_id, shape_pt_lat, shape_pt_lon, shape_pt_sequence, shape_dist_traveled)

write_csv(shapes, "out/shapes.txt", na = '')

  


