source('LoadProcess.R')

dt.measure <- LoadData()
dt.analyse <- ProcessData(dt.measure)
rm(dt.measure)

# Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
plot2(dt.analyse)
dev.off()