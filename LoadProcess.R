# include necessary library
library(dplyr)
library(lubridate)

LoadData <- function (){

  filename <- "household_power_consumption.txt"

  # Data Loading - rows are seperated using ';'
  dt.measure <- read.table(filename, header = T, sep = ';', stringsAsFactors = F)
  
  # str(dt.measure)
  dt.measure
}

ProcessData <- function(dt.measure = dt.measure){
  start_ymd <- ymd('2007-02-01')
  end_ymd <- ymd('2007-02-02')
  dt.analyse <-  dt.measure %>% 
    mutate(Date = dmy(as.character(Date)), DateTime = paste(Date,Time)) %>%
    filter(Date >= start_ymd & Date <= end_ymd)
  
  # head(dt.analyse)
  # tail(dt.analyse)
  
  dt.analyse <- dt.analyse %>%  
    mutate( DateTime = ymd_hms(DateTime)
            , Global_active_power = as.numeric(Global_active_power)
            , Global_reactive_power = as.numeric(Global_reactive_power)
            , Voltage = as.numeric(Voltage)
            , Global_intensity = as.numeric(Global_intensity)
            , Sub_metering_1 = as.numeric(Sub_metering_1)
            , Sub_metering_2 = as.numeric(Sub_metering_2)
            , Sub_metering_3 = as.numeric(Sub_metering_3))   
  
  dt.analyse
}

plot2 <- function(dt.analyse = dt.analyse){
  with(dt.analyse, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
}

plot3 <- function(dt.analyse = dt.analyse, box_yn = TRUE){
  inset_value <- ifelse(box_yn == TRUE, 0, 0.01)
  box_lty_value <- ifelse(box_yn == TRUE, 1, 0)
  with(dt.analyse, plot(DateTime, Sub_metering_1, type="l", col="black", xlab="", ylab = "Energy sub metering"))
  with(dt.analyse, lines(DateTime, Sub_metering_2, type="l", col="red"))
  with(dt.analyse, lines(DateTime, Sub_metering_3, type="l", col="blue"))
  legend("topright", inset = inset_value
         , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         , col = c("black", "red", "blue")
         , lty = c(1,1,1)
         , box.lty = box_lty_value
         , cex = 0.9)
}
