library(tidyverse)
library(lubridate)

annual_v2 <- read.csv("C:/Users/KasiolEr/Desktop/annual.csv")
str(counts)
annual_v2$ride_id <- as.numeric(annual_v2$ride)
counts <- aggregate(annual_v2$rideable_type ~ annual_v2$member_casual + annual_v2$day_of_week, FUN = mean)
write.csv(counts, "C:/Users/KasiolEr/Desktop/number_of_ridesl.csv")