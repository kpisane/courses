# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Keep only mobile sources
mobile <- subset(SCC, SCC.Level.One == "Mobile Sources")

# Keep only highway vehicles (no Aircrafts, Marine Vessels, logging equip., etc.)
motv <- grep("Highway Vehicles", mobile$SCC.Level.Two)
motv <- mobile[motv,]
# Get the SCC values for these entries
SCCvals <- as.character(motv$SCC)

# Keep only the NEI entries corresponding to the SCC values for motor vehicle sources
# also, keep only those measurement that were taken in Baltimore City (fips = "24510")
d0 <- subset(NEI, NEI$SCC %in% SCCvals & NEI$fips == "24510")

#plot
png("plot5.png")
plot(seq(1999, 2008, 3), tapply(d0$Emissions, d0$year, mean), 
     xlab = "Year", ylab = "Average Emissions (tons)", 
     col = "blue", pch = 19, main = "Average Motor Vehicle Emissions")
dev.off()

