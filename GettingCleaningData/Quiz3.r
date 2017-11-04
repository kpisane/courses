setwd("C:/Users/Kelly/Desktop/DataScience/Getting and Cleaning Data")
##download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "Quiz3_1.csv")
##download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf", destfile = "Quiz3_1_codebook.pdf")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "Quiz3_2.jpg", mode = 'wb')
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "Quiz3_3_gdp.csv")
##download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "Quiz3_3_education.csv")


data3.1 <- read.csv("Quiz3_1.csv")
data3.2 <- readJPEG("Quiz3_2.jpg", native = TRUE)



#Question 1:

agricultureLogical <- data3.1$ACR==3 & data3.1$AGS==6
which(agricultureLogical)

# Question 2:
quantile(data3.2, probs = c(0, 0.3, 0.8, 1))

#Question 3:
#in education, the short code is titled "CountryCode"
#in gdp, it is labeled "X"
## there are 224 countries that are listed in both tables
data3.3.gdp <- read.csv("Quiz3_3_gdp.csv", skip = 4, header = TRUE)
data3.3.education <- read.csv("Quiz3_3_education.csv")
data3.3.gdp <- select(data3.3.gdp, X, X.1, X.3, X.4)
names(data3.3.gdp)<-c("CountryCode", "Ranking", "Economy", "GDP")
keepers <- data3.3.gdp$Ranking %in% 1:190
rank.data3.3.gdp <- data3.3.gdp[keepers,]
rank.data3.3.gdp$Ranking <- as.numeric(as.character(rank.data3.3.gdp$Ranking))
ordered.gdp <- arrange(rank.data3.3.gdp, desc(Ranking))
ordered.gdp[13,"Economy"]

new.df <- merge(data3.3.education, data3.3.gdp)
new.df$Ranking <- as.numeric(new.df$Ranking)

split.df <- split(new.df, new.df$Income.Group)
summary <- lapply(split.df, summary, na.rm=TRUE)
summary$`High income: OECD`
summary$`High income: nonOECD`

qtls <- quantile(new.df$Ranking, probs = c(0.2,0.4,0.6,0.8,1))

test1 <- filter(new.df, Income.Group == "Lower middle income", Ranking <=40.8)
test2 <- filter(new.df, Ranking>=qtls[4] & Income.Group == "Lower middle income")
