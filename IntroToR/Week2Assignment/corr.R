corr <- function(directory, threshold=0){
  # run the complete function to get a table that includes id
  # and number of complete cases for each id
  completes <- complete(directory)
  # determine which ids have number of complete cases greater 
  # than or equal to the threshold
  keepers <- completes[,2]>=threshold
  use <- completes[keepers,1]
  use <- filelist[keepers]
  use.these <- paste(directory, use,sep="/")
  #initialize vector where I will save the correlation values
  cors <- c()
  
  # for loop reads in data and calculates correlation
  for (i in 1:length(use.these)){
    data <- read.csv(use.these[i])
    # keep only complete cases
    y <- complete.cases(data)
    data <- data[y,]
    #calculate correlation between sulfate and nitrate columns
    xi<-cor(data[,2],data[,3])
    cors <- c(cors,xi)
  }
  cors
}