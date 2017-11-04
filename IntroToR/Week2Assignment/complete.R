complete <- function(directory, id=1:332){
  #get the file ids from the directory
  filelist <- list.files(directory)
  x <- paste(directory, filelist, sep="/")
  x <- x[id]
  #initialize a data frame to store info in
  nobs.df<-data.frame()
  #for loop reads in data, saves id to column 1
  #then determines number of complete cases in the data
  #sums the logical vector defined by (complete.cases(data))
  #because all TRUEs are 1 and FALSEs are 0
  for (i in 1:length(id)){
    data <- read.csv(x[i])   
    nobs.df[i,1]<-id[i]
    nobs.df[i,2] <-sum(complete.cases(data))
  }
  #name the colunms in the data frame
  colnames(nobs.df) <- c("id","nobs")
  #returns the data frame
  nobs.df
}