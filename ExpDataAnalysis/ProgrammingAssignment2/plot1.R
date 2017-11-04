# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Extract the information I care about
totals <- tapply(NEI$Emissions, NEI$year, sum)
#open a png file for the plot-I am keeping the default width, height, etc.
png(filename = "plot1.png")
plot(names(totals), totals, xlab = "Year", ylab = "Total Emissions (tons)", col= "red", pch = 19)
dev.off()