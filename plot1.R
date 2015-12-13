source('common.R')

table <- readTable()

transformedTable <- transformTable(table)

png('plot1.png')
par(mfrow=c(1,1))
hist(transformedTable$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power",
     col="red")

dev.off()
