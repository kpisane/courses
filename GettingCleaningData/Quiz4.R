#Quiz 4 Question 1
setwd("C:/Users/Kelly/Desktop/DataScience/Getting and Cleaning Data")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/Quiz4_1.csv")
data <- read.csv("./data/Quiz4_1.csv")
test <- strsplit(names(data), "wgtp")
#Quiz 4 Question 2
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./data/Quiz4_2.csv")
data <- read.csv("./data/Quiz4_2.csv", skip = 4)
library(dplyr)
data <- select(data, X, X.1, X.3, X.4)
names(data) <- c("countrycode", "ranking", "country", "gdp")
data <- filter(data, ranking %in% 1:190)
gdp <- as.numeric(gsub(",", "", data$gdp))
mean(gdp, na.rm = TRUE)
#Question 3
grep("^United",data$country)
#Question 4
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./data/Quiz4_4_gdp.csv")
data.gdp <- read.csv("./data/Quiz4_4_gdp.csv", skip = 4)
data.gdp <- select(data.gdp, X, X.1, X.3, X.4)
data.gdp <- filter(data.gdp, X.1 %in% 1:190)
names(data.gdp)<- c("code", "rank", "country", "gdp")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl, destfile = "./data/Quiz4_4_education.csv")
data.education <- read.csv("./data/Quiz4_4_education.csv")
Data <- merge (x = data.gdp, y = data.education, by.x = "code", by.y = "CountryCode")
fiscal.info <- Data$Special.Notes[grepl("[Ff]iscal", Data$Special.Notes)]
sum(grepl("Fiscal year end: June", fiscal.info))
#Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) #this is a vector of dates with class, date
sum(year(sampleTimes)==2012)
oneyear <- sampleTimes[year(sampleTimes)==2012]
sum(wday(oneyear)==2)
