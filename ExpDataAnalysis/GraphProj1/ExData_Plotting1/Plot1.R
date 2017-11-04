# Kelly Pisane
# 2 May 2017
# Coursera: Exploratory Data Analysis
# Week 1: Programming Assignment
################################################################################
# Read in the rows of the data table that correspond to 1st & 2nd February 2007
filepath <- "C:/Users/Kelly/Desktop/DataScience/Exploratory Data Analysis/data/household_power_consumption.txt"
power <- read.table(file = filepath,
                    sep = ";", nrows = 2880, skip = 66637, na.strings = "?")
colnames(power) <- unlist(strsplit(readLines(con = filepath, n=1), split = ";"))
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Time <- strptime(power$Time, "%H:%M:%S")

par(mfrow = c(1,1))
png(filename = "Plot1.png", width = 480, height = 480)
with(power, hist(Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"))
dev.off()
