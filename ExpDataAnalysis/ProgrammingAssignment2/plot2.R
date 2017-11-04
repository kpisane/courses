# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# For Baltimore City, fips == "24510"
BCity <- subset(NEI, NEI$fips == "24510")
BCityTotals <- tapply(BCity$Emissions, BCity$year, sum)
# Generate Plot
png("plot2.png")
plot(names(BCityTotals), BCityTotals, pch = 19, col = "blue", lwd = 8,
     xlab = "Year", ylab = "Total Emissions (tons)", 
     main = "Baltimore City")
dev.off()