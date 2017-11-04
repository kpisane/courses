# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?

# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Narrow down to only combustion-related sources using Level One
combustion <- grep("[Cc]ombustion", SCC$SCC.Level.One)
SCCcomb <- SCC[combustion,]
# Further narrow down to only coal combustion-related sources using level three
coal <- grep("[Cc]oal", SCCcomb$SCC.Level.Three)
SCCcoal <- SCCcomb[coal, ]

# Extract the SCC values I will use to get the info I need from NEI
SCCvalues <- SCCcoal$SCC

# Subset the NEI data to include only the SCC values for coal combustion
cc <- subset(NEI, NEI$SCC %in% SCCvalues)
totalcc <- data.frame(Emissions = tapply(cc$Emissions, cc$year, sum))
totalcc <- cbind(Year = rownames(totalcc), totalcc)
png("plot4.png")
ggplot(totalcc, aes(totalcc$Year, totalcc$Emissions)) + 
  geom_point(color = "red", size = 3) + 
  xlab("Year") + ylab("Total Emissions (tons)") +
  ggtitle("Emissions from Coal Combustion-Related Sources")
dev.off()
