# Generate Keys Files
library(tidyverse)

# stop_times ----

stop_times <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vTh7EfRpX0CbpnTrLB7ItujwRaaGS7GpiH7F-0pn6nZT62rtqortBZpCpdyIGelJMQKlYS99GyNr4H9/pub?gid=1050763692&single=true&output=csv",
                       col_types = cols(
                         trip_id = col_character(),
                         arrival_time = col_time(format = ""),
                         departure_time = col_time(format = ""),
                         stop_id = col_integer(),
                         stop_sequence = col_integer(),
                         stop_headsign = col_character(),
                         pickup_type = col_character(),
                         drop_off_type = col_character(),
                         shape_dist_traveled = col_character(),
                         timepoint = col_character()
                       )) %>% 
  mutate(departure_time = arrival_time)


write_csv(stop_times, "out/stop_times.txt", na = '')

# Routes ----

routes <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vTh7EfRpX0CbpnTrLB7ItujwRaaGS7GpiH7F-0pn6nZT62rtqortBZpCpdyIGelJMQKlYS99GyNr4H9/pub?gid=985397&single=true&output=csv",
                   col_types = cols(
                     route_id = col_integer(),
                     agency_id = col_integer(),
                     route_short_name = col_integer(),
                     route_long_name = col_character(),
                     route_desc = col_character(),
                     route_type = col_integer(),
                     route_url = col_character(),
                     route_color = col_character(),
                     route_text_color = col_character()
                   ))

write_csv(routes, "out/routes.txt", na = '')

# Trips ----

trips <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vTh7EfRpX0CbpnTrLB7ItujwRaaGS7GpiH7F-0pn6nZT62rtqortBZpCpdyIGelJMQKlYS99GyNr4H9/pub?gid=588662503&single=true&output=csv")

write_csv( trips, "out/trips.txt", na = '')

# Calendar ---

calendar <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vTh7EfRpX0CbpnTrLB7ItujwRaaGS7GpiH7F-0pn6nZT62rtqortBZpCpdyIGelJMQKlYS99GyNr4H9/pub?gid=2012348353&single=true&output=csv")

write_csv(calendar, "out/calendar.txt", na = '')

# Fare Attributes ----

fare_attributes <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vTh7EfRpX0CbpnTrLB7ItujwRaaGS7GpiH7F-0pn6nZT62rtqortBZpCpdyIGelJMQKlYS99GyNr4H9/pub?gid=1541523136&single=true&output=csv")

write_csv( fare_attributes, "out/fare_attributes.txt", na = '')

# Stops ----

stops <- read_csv("master_list.csv")

write_csv(stops, "out/stops.txt", na = '')

  