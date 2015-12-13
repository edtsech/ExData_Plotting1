source('common.R')

table <- readTable()

transformedTable <- transformTable(table)

png('plot4.png')
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

dev.off()