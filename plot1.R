source('LoadProcess.R')

dt.measure <- LoadData()
dt.analyse <- ProcessData(dt.measure)
rm(dt.measure)

# Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
with(dt.analyse, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
