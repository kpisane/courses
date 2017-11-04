best<-function(state,outcome){
    ##read outcome data
    x <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
        ##set the mortality rates as numeric values
    x[,11] <- as.numeric(x[,11]) 
    x[,17] <- as.numeric(x[,17]) 
    x[,23] <- as.numeric(x[,23]) 
#        ##set the values for state as factors
    my.factor <- as.factor(x$State)
##check that the state and outcome selections are valid
    if(!is.element(state,x$State)) {
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
    
    ## This next section finds the minimum mortality rate
    p <- paste("Hospital.30.Day.Death..Mortality..Rates.from.",
               o, sep="")
    locations <- unique(my.factor)
    location <- which(locations==state)
    x.split <- split(x, x$State)
    data.of.interest<-x.split[[state]]
    hospital <- which.min(data.of.interest[[p]])
    hospital <- data.of.interest$Hospital.Name[hospital]

    hospital
}



## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death ## rate