source('common.R')

table <- readTable()

transformedTable <- transformTable(table)

png('plot3.png')
par(mfrow=c(1,1))
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

dev.off()