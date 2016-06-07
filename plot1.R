### Creates plot1.png as specified in the week 1 assignment for Exploratory Data Analysis


plot1 <- function()  {
  
  ## Load the data
  
  setwd('Data')
  
  cc <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric",
          "numeric")
  
  rawdata <- read.table('household_power_consumption.txt', sep = ";", na.strings = "?", 
                        colClasses = cc, header = TRUE)
  
  data2 <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")
  
  ## Plot the histogram
  
  hist(data2$Global_active_power, col = "Red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)")
  
  
  ## Copy to the png device
  
  dev.copy(png)
  dev.off()
  
}