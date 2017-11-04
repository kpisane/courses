rankhospital<-function(state,outcome,num="best"){
  #read in data
  data <- read.csv("outcome-of-care-measures.csv")
  if(!is.element(state,data$State)) {
    print("invalid state")
  }
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
  data.split <- split(data, data$State)
  data.of.interest <- data.split[[state]]
  test <- data.of.interest[[p]]!="Not Available"
  only.rankable <-data.of.interest[test,c(2,11,17,23)]
  only.rankable[[p]]<-as.numeric(as.character(only.rankable[[p]]))
  ordered.data<-only.rankable[order(only.rankable[[p]],only.rankable$Hospital.Name),]
  if (!is.integer(num)){
      if (num=="best"){
          num<<-1
      } else if (num=="worst") {
          num<<-length(ordered.data$Hospital.Name)
      }
  }
  ordered.data$Hospital.Name[num]
}