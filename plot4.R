source('LoadProcess.R')

dt.measure <- LoadData()
dt.analyse <- ProcessData(dt.measure)
rm(dt.measure)

# Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12)
par(mfrow=c(2,2))
plot2(dt.analyse)
with(dt.analyse, plot(DateTime, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))
plot3(dt.analyse, FALSE)
with(dt.analyse, plot(DateTime, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()