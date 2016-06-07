### Creates plot4.png as specified in the week 1 assignment for Exploratory Data Analysis


plot4 <- function()  {
  
  ## Load the data
  
  setwd('Data')
  
  cc <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric",
          "numeric")
  
  rawdata <- read.table('household_power_consumption.txt', sep = ";", na.strings = "?", 
                        colClasses = cc, header = TRUE)
  
  data2 <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")
  
  ###  Create a date/time variable data2$dtg
  
  data2$dtg <- paste(data2$Date, data2$Time)
  data2$dtg <- strptime(data2$dtg, "%d/%m/%Y %H:%M:%S")
  
  ### Set up plot window
  
  par(mfrow = c(2,2))
  
  
  ## Plot upper left
  
  with(data2, plot(dtg, Global_active_power, type = "l", 
                   ylab = "Global Active Power (kilowatts)", xlab = ""))
  
  ## Plot upper right
  
  with(data2, plot(dtg, Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage'))
  
  ## Plot lower left
  
  with(data2, plot(dtg, Sub_metering_1, type = "l", 
                   ylab = "Energy sub metering", 
                   xlab = "", ylim = c(0.0,38.0)))
  
  par(new = T)
  

  with(data2, plot(dtg, Sub_metering_2, type = "l", 
                   ylab = "", xlab = "", 
                   col = "red", ylim = c(0.0,38.0)))
  
  par(new = T)

  with(data2, plot(dtg, Sub_metering_3, type = "l", 
                   ylab = "", xlab = "", 
                   col = "blue", ylim = c(0.0,38.0)))
  

  legend("topright", legend = 
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col = c("black","red","blue"), lty=c(1,1,1))
  
  
  ## Plot lower right
  
  with(data2, plot(dtg, Global_reactive_power, type = 'l', xlab = 'datetime'))
  
  
  
  
  
  
  
  
  ## Copy to the png device
  
  dev.copy(png)
  dev.off()
  
}