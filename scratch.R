library(dplyr)
library(lubridate)

table <- read.table('household_power_consumption.txt', sep=";", header = F, skip=66637)

transformedTable <- table %>% 
  mutate(DateTime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),
         Date = parse_date_time(Date, "%d/%m/%Y"),
         Time = as.POSIXct(Time, format = "%H:%M:%S")) %>%
  filter(Date == parse_date_time("01/02/2007", "%d/%m/%Y") |
         Date == parse_date_time("02/02/2007", "%d/%m/%Y"))

# 1 task
par(mfrow=c(1,1))

hist(as.numeric(transformedTable$Global_active_power),
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power",
     col="red")

# 2 task
plot2 <- plot(y = transformedTable$Global_active_power, 
     x = transformedTable$DateTime, 
     type='l',
     xlab="", 
     ylab="Global Active Power (kilowatts)",
     col = 'black')

# 3 task
plot3 <- plot(y = transformedTable$Sub_metering_1, 
              x = transformedTable$DateTime, 
              type='l',
              xlab="", 
              ylab="Energy sub metering",
              col = 'black')

lines(transformedTable$DateTime,transformedTable$Sub_metering_2,col="red")
lines(transformedTable$DateTime,transformedTable$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c('black', 'red', 'blue'),
       lty=1, lwd=2)

# 4 task
par(mfrow=c(2,2))
plot4a <- plot(y = transformedTable$Global_active_power, 
              x = transformedTable$DateTime, 
              type='l',
              xlab="", 
              ylab="Global Active Power (kilowatts)",
              col = 'black')

plot4b <- plot(y = transformedTable$Voltage, 
               x = transformedTable$DateTime, 
               type='l',
               xlab="", 
               ylab="Voltage",
               col = 'black')

plot4c <- plot(y = transformedTable$Sub_metering_1, 
               x = transformedTable$DateTime, 
               type='l',
               xlab="", 
               ylab="Energy sub metering",
               col = 'black')

lines(transformedTable$DateTime,transformedTable$Sub_metering_2,col="red")
lines(transformedTable$DateTime,transformedTable$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c('black', 'red', 'blue'),
       lty=1, lwd=2, bty= 'n')

plot4d <- plot(y = transformedTable$Global_reactive_power, 
               x = transformedTable$DateTime, 
               type='l',
               xlab="", 
               ylab="Global reactive power",
               col = 'black')

sapply(table, typeof)
