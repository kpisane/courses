#Lecture 1: Editing Text Values
##First Example
setwd("C:/Users/Kelly/Desktop/DataScience/Getting and Cleaning Data")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
# there is a capital letter in the fourth name.  
# make all names lowercase
tolower(names(cameraData))
#alternatively, to make them uppercase
toupper(names(cameraData))
#to split variable names (e.g. "Location.1")
splitNames <- strsplit(names(cameraData), "\\.")
#the \\ is necessary because a . is reserved character
splitNames
#Note that splitNames[[6]] gives: "Location" "1"
#splitNames[[6]][1] gives: "Location"
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)
#above will return only the first element of every name


##Second Example
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv")
download.file(fileUrl2, destfile = "./data/solutions.csv")
reviews <- read.csv("./data/reviews.csv");solutions <- read.csv("./data/solutions.csv")

head(reviews,2)
head(solutions,2)
#to substitute the _ out of the names
sub("_", "", names(reviews))
testName <- "this_is_a_test"
sub("_","",testName) #only removes first one
gsub("_","",testName) #removes all
#searching for strings
grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))
#grepl returns a logical, table makes the output of grepl a table
#if we want to subset using grepl
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]
#above returns only observations that do not include Alameda
# if we add value=TRUE, we can get the value where Alameda occurs
grep("Alameda", cameraData$intersection, value=TRUE)
#there is some additional useful stuff in stringr pkg
library(stringr)
nchar("Jeffrey Leek") #gives number of char in string
#get a subset of the string
substr("Jeffrey Leek", 1, 7) #returns 1st through 7th character
paste("Jeffrey", "Leek") #default sep is space
#to paste without space
paste0("Jeffrey", "Leek")
#trim off excess space at end of string
str_trim("Jeff     ")


#Lecture 2: Regular Expressions
#see notebook

#Lecture 3: Regular Expressions II
#see notebook

#Lecture 4: Working with Dates
d1 <- date()
class(d1) #character
d2 <- Sys.Date()
class(d2) #date
#formatting dates (make them more visually appealing)
format(d2, "%a %b %d")
#creating dates
x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z <- as.Date(x, "%d%b%Y")
z[1]-z[2]
as.numeric(z[1]-z[2])
weekdays(d2)
months(d2)
julian(d2)
#Lubridate Package
library(lubridate)
ymd("20140108")
mdy("08/04/2015")
dmy("14022017")
ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03", tz="Pacific/Auckland")
Sys.timezone()# gives my system time zone (America/New_York)
x<-dmy(x)
wday(x[1])
wday(x[1], label = TRUE)
