library(dplyr)
library(lubridate)
# Read in the rows of the data table that correspond to 1st & 2nd February 2007
filepath <- "C:/Users/Kelly/Desktop/DataScience/Exploratory Data Analysis/data/household_power_consumption.txt"
power <- read.table(file = filepath,
                    sep = ";", nrows = 2880, skip = 66637, na.strings = "?")
colnames(power) <- unlist(strsplit(readLines(con = filepath, n=1), split = ";"))

power$datetime <- with(power, as.POSIXct(paste(Date, Time), 
                                         format="%d/%m/%Y %H:%M:%S"))

png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar=c(4, 4, 3, 2))
plot(power$datetime, power$Global_active_power, type = "n", xlab = "",
     ylab = "Global Active Power")
lines(power$datetime, power$Global_active_power, xlab = "", 
      ylab = "Global Active Power")
plot(power$datetime, power$Voltage, type = "n", xlab = "datetime", 
     ylab = "Voltage")
lines(power$datetime, power$Voltage)
plot(power$datetime, power$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(power$datetime, power$Sub_metering_1, col = "black")
lines(power$datetime, power$Sub_metering_2, col = "red")
lines(power$datetime, power$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1,1),
       pt.cex = 1,cex = 1, bty = "n")
plot(power$datetime, power$Global_reactive_power, type = "n", 
     xlab = "datetime", ylab = "Global_reactive_power")
lines(power$datetime, power$Global_reactive_power)
dev.off()
