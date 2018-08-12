library(tidyverse)
library(ggmap)

# get raw data ------------------------------------------------------------

raw_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vTh7EfRpX0CbpnTrLB7ItujwRaaGS7GpiH7F-0pn6nZT62rtqortBZpCpdyIGelJMQKlYS99GyNr4H9/pub?gid=347134897&single=true&output=csv",
                     col_types = cols(
                       stop_id = col_character(),
                       stop_code = col_character(),
                       stop_name = col_character(),
                       stop_desc = col_character(),
                       stop_lat = col_number(),
                       stop_lon = col_number(),
                       stop_address = col_character()
                     ))

existing_data <- read_csv("master_list.csv",
                          col_types = cols(
                            stop_id = col_character(),
                            stop_code = col_character(),
                            stop_name = col_character(),
                            stop_desc = col_character(),
                            stop_lat = col_number(),
                            stop_lon = col_number(),
                            stop_address = col_character()
                          ))

# Filter out addresses that have already been geocoded

df_complete <- raw_data %>% 
  filter(!is.na(stop_lat), !is.na(stop_lon))

df_raw <- raw_data %>% 
  anti_join( ., df_complete) %>% 
  mutate_geocode(location = stop_address) %>% 
  rename(stop_lat = lat,
         stop_lon = lon)

# Combine the two data reames

df_complete <- df_complete %>% 
  bind_rows(df_raw)

write_csv(df_complete, "master_list.csv")
