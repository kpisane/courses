library(dplyr)
library(lubridate)
par(mfrow = c(1,1))
# Read in the rows of the data table that correspond to 1st & 2nd February 2007
filepath <- "C:/Users/Kelly/Desktop/DataScience/Exploratory Data Analysis/data/household_power_consumption.txt"
power <- read.table(file = filepath,
                    sep = ";", nrows = 2880, skip = 66637, na.strings = "?")
colnames(power) <- unlist(strsplit(readLines(con = filepath, n=1), split = ";"))
power$fulldate <- with(power, as.POSIXct(paste(Date, Time), 
                                         format="%d/%m/%Y %H:%M:%S"))

png(filename = "Plot2.png", width = 480, height = 480)
plot(power$fulldate, power$Global_active_power, type = "n", xlab = "",
      ylab = "Global Active Power (kilowatts)")
lines(power$fulldate, power$Global_active_power, xlab = "", 
                  ylab = "Global Active Power (kilowatts)")

dev.off()
