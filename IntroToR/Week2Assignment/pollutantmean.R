pollutantmean <- function(directory, pollutant, id = 1:332){
    #get the file ids from the directory
    filelist <- list.files(directory)
    filelist <- filelist[id]
    x <- paste(directory, filelist, sep="/")
    #initialize a vector y where I can store the data I need
    y <- c()
    #for loop reads in the data and appends it to vector y
    for (i in 1:length(x)) {
        data <- read.csv(x[i])
        if (pollutant == "nitrate"){
            yi <- data[,3]
        } else if (pollutant == "sulfate"){
            yi <- data[,2]
        } 
        #vector will contain all data from pollutant and ids specified
        y <- c(y,yi) 
    }
    #calculate the mean of all the values in y without including NAs
    mean(y, na.rm = TRUE)
     
}