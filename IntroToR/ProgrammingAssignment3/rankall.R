each.state<-function(x,outcome,num){
  if(!is.element(outcome, c("heart attack", "Heart Attack", 
                            "heart failure", "Heart Failure",
                            "pneumonia", "Pneumonia"))) {
    print("invalid outcome")
  } else if (is.element(outcome, c("heart attack", "Heart Attack"))){
    o <<- "Heart.Attack"
  } else if (is.element(outcome, c("heart failure", "Heart Failure"))){
    o <<- "Heart.Failure"
  } else {
    o <<-"Pneumonia"
  }
  p <- paste("Hospital.30.Day.Death..Mortality..Rates.from.",
             o, sep="")

  test <- x[[p]]!="Not Available"
  only.rankable <-x[test,c(2,11,17,23)]
  only.rankable[[p]]<-as.numeric(as.character(only.rankable[[p]]))
  ordered.data<-only.rankable[order(only.rankable[[p]],only.rankable$Hospital.Name),]
  if (!is.integer(num)){
    if (num=="best"){
      num<<-1
    } else if (num=="worst") {
      num<<-sum(test)
    }
  }
  ordered.data$Hospital.Name[num]
}


rankall<-function(outcome, num="best"){
  #read in data
  data <- read.csv("outcome-of-care-measures.csv")
  data.split <- split(data, data$State)
  results<-lapply(data.split, each.state, outcome, num)
  states<-as.character(unique(data$State))
  colnames(my_matrix)<-c("hospital", "state")
  my_matrix[,2]<-states
  for (i in 1:54){
      my_matrix[i,1]<-as.character(results[[my_matrix[i,2]]])
  }
  my_matrix
}