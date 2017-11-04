library(ggplot2)
# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Select only the Baltimore City data (fips = "24510")
BCity <- subset(NEI, NEI$fips == "24510")
# Split into the 1999 data and the 2008 data
data0 <- subset(BCity, BCity$year=="1999")
data1 <- subset(BCity, BCity$year=="2008")
# Take the totalfor each type of source in 1999 and 2008
d0 <- tapply(data0$Emissions, data0$type, sum)
d0 <- cbind(type = rownames(d0), Year = rep(1999, 4), Emissions = d0)
d1 <- tapply(data1$Emissions, data1$type, sum)
d1 <- cbind(type = rownames(d1), Year = rep(2008, 4), Emissions = d1)
# Row bind the datasets
mrg <- data.frame(rbind(d0, d1))
# Plot
png("plot3.png")
g <- ggplot(mrg, aes(x = Year, y = Emissions))
g + geom_point(aes(color = type), size = 5) + 
  ylab("Total Emissions (tons)")
dev.off()
