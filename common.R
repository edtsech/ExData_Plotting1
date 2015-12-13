library(dplyr)
library(lubridate)

readTable <- function() {
  table <- read.table('household_power_consumption.txt', sep=";", header = F, skip=66637, nrow= 106957 - 66637,
                      na.strings = "?")
  names(table) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
  table
}

transformTable <- function(table) {
  table %>% 
  mutate(DateTime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),
         Date = parse_date_time(Date, "%d/%m/%Y")) %>%
  filter(Date == parse_date_time("01/02/2007", "%d/%m/%Y") |
         Date == parse_date_time("02/02/2007", "%d/%m/%Y"))
}