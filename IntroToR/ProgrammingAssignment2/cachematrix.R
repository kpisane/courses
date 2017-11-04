## These functions allow one to cache a matrix's inverse and 
## report the cached inverse when it is called for rather than
## computing it each time it is needed

## makeCacheMatrix takes a matrix as its argument and creates
## a list where each element is a function.  The functions do
## the following:
##  1.  set the value of the matrix
##  2.  get the value of the matrix
##  3.  set the value of the inverse
##  4.  get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    s<-NULL
    set<-function(x){
        x<<-y
        s<<-NULL
    }
    get<-function() x
    setinverse<-function(solve) s <<- solve
    getinverse<-function() s
    list(set=set, get=get, 
         setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve attempts to read the cached value of the inverse.  
## If it is not null (there is a cached value), then cacheSolve 
## returns the cached value.  If there is no cached value of
## the inverse, then cacheSolve calculates the inverse and 
## sets the value of the inverse in the list created by makeCacheMatrix

cacheSolve <- function(x, ...) {
    s <- x$getinverse()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setinverse(s)
    s
}
