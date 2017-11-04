#Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == 06037). 
# Which city has seen greater changes over time in motor vehicle emissions?
library(dplyr)
library(lattice)

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
# also, keep only those measurement that were taken in Baltimore City (fips = "24510") or 
# Los Angeles (fips = "06037")
Baltimore <- subset(NEI, NEI$SCC %in% SCCvals & NEI$fips == "24510")
LosAngeles <- subset(NEI, NEI$SCC %in% SCCvals & NEI$fips == "06037")
#There is an entry in LosAngeles dataset that is suspicious (1643.85 tons), remove it
t <- which(LosAngeles$Emissions == max(LosAngeles$Emissions))
LosAngeles <- LosAngeles[-t,]

mB <- data.frame(Emissions = tapply(Baltimore$Emissions, Baltimore$year, mean))
mB$year <- seq(1999, 2008, 3)
mLA <- data.frame(Emissions = tapply(LosAngeles$Emissions, LosAngeles$year, mean))
mLA$year <- seq(1999, 2008, 3)

#Now, what I want is the change in emissions.  It makes sense to compare the percentage change
mB$rate <- mB$Emissions/mB$Emissions[1]
mB$city <- "Baltimore"
mLA$rate <- mLA$Emissions/mLA$Emissions[1]
mLA$city <- "Los Angeles"
#Create one Data Frame
df <- rbind(mLA, mB)

#plot
png("plot6.png")
#xyplot(rate~year|city, df, pch = 19, xlab = "Year", ylab = "Percentage of 1999 Emissions",
#       main = "Average Motor Vehicle Emissions per Year") 
xyplot(Emissions~year|city, df, pch = 19, xlab = "Year", ylab = "Emissions (tons)",
       main = "Average Motor Vehicle Emissions")

dev.off()