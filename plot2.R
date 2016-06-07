### Creates plot2.png as specified in the week 1 assignment for Exploratory Data Analysis


plot2 <- function()  {
  
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
  
  with(data2, plot(dtg, Global_active_power, type = "l", 
                   ylab = "Global Active Power (kilowatts)", xlab = ""))
  
  
  
  
  ## Copy to the png device
  
  dev.copy(png)
  dev.off()
  
}