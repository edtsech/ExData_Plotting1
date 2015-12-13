source('common.R')

table <- readTable()

transformedTable <- transformTable(table)

png('plot2.png')
par(mfrow=c(1,1))
plot2 <- plot(y = transformedTable$Global_active_power, 
              x = transformedTable$DateTime, 
              type='l',
              xlab="", 
              ylab="Global Active Power (kilowatts)",
              col = 'black')

dev.off()