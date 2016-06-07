### Creates plot3.png as specified in the week 1 assignment for Exploratory Data Analysis


plot3 <- function()  {
  
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
  
 
  ### Plot the first variable
  
  with(data2, plot(dtg, Sub_metering_1, type = "l", 
                   ylab = "Energy sub metering", 
                   xlab = "", ylim = c(0.0,38.0)))
  
  par(new = T)

  ## Plot the second variable  
  
  with(data2, plot(dtg, Sub_metering_2, type = "l", 
                   ylab = "", xlab = "", 
                   col = "red", ylim = c(0.0,38.0)))
  
  par(new = T)
  
  ## Plot the third variable
  with(data2, plot(dtg, Sub_metering_3, type = "l", 
                   ylab = "", xlab = "", 
                   col = "blue", ylim = c(0.0,38.0)))
  
  
  ## Add legend to plot
  
  legend("topright", legend = 
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col = c("black","red","blue"), lty=c(1,1,1))
  
  
  ## Copy to the png device
  
  dev.copy(png)
  dev.off()
  
}