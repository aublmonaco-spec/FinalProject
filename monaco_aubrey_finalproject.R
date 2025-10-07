library(ggplot2)
library(dplyr)
library(sf)
library(spData)
library(lubridate)
getwd()
cardinal_flower <- read.csv("cardinal_flower_nat.csv")
world <- world
us <- world[world$name_long == "United States", ]

cardinal_flower <- cardinal_flower %>%
  mutate(observed_on = parse_date_time(observed_on, orders = c("mdy", "ydm", "dmy"))) %>%
  mutate(year = year(observed_on))

cf2010 <- cardinal_flower %>%
  filter(year == "2010") %>%
  mutate(sd = sd(observed_on))

cf2017 <- cardinal_flower %>%
  filter(year == "2017")

cf2025 <- cardinal_flower %>%
  filter(year == "2025")

cardinal_flower <- cardinal_flower %>%
  filter(year %in% c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025"))

rth_1995_2021 <- read.csv("RTH_1995_2021.csv")
rth_2022_2025 <- read.csv("RTH_2022_2025.csv")

ggplot() + geom_sf(data = us) + geom_point(data = cardinal_flower, aes(x = longitude, y = latitude, color = year))
ggplot() + geom_sf(data = us) + geom_point(data = rth_1995_2021, aes(x = Longitude, y = Latitude, color = Year)) + geom_point(data = rth_2022_2025, aes(x = Longitude, y = Latitude, color = Year)) 
