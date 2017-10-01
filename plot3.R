source('LoadProcess.R')

dt.measure <- LoadData()
dt.analyse <- ProcessData(dt.measure)
rm(dt.measure)

# Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12)
plot3(dt.analyse)
dev.off()