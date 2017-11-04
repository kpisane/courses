---
title: "Quiz1"
author: "KellyPisane"
date: "April 19, 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
## Notes on Quiz 1
I downloaded the following file using download.file():
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
Unfortnately, I got the follwing error when I tried to read the file using read.xlsx:
  Error in .jcall("RJavaTools", "Ljava/lang/Object;", "invokeMethod", cl,  : 
  java.util.zip.ZipException: invalid code -- missing end-of-block
I also could not open the .xlsx file that I had downloaded using Excel
I found the following post on StackOverflow:
  http://stackoverflow.com/questions/28325744/r-xlsx-package-error
By setting mode="wb" (write binary) in the download.file function, I was able to get a successful download that I could read in with read.xlsx

##Question 4 (XML)
Here is what I have done so far:
1. downloaded the file to my local machine (couldn't get it to read directly from the internet)
2. used xmlTreeParse on the downloaded file and saved as the value 'doc'
3. I set rootNode to be xmlRoot(doc).  root node was an insanely long thing, so I am not sure what all is in it just yet
4. when i pulled rootNode[[1]] to look at first element, I got another stupid long thing, i set this temporarily to be new.rootNode
5. new.rootNode[[1]] is one element (row in this case)
6. new.rootNode[[1]][[2]] is the zip code
7. I used xpathSApply(new.rootNode, "//zipcode", xmlValue) to return a vector of the zipcodes

