library(lattice)
library(datasets)
xyplot(Ozone ~ Wind, data = airquality)

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)
# in general, it is the autoprinting feature in R that makes the 
# plot visible.  The commands in lattice pkg create plot objects 
# of class trellis.  Printing those objects produces the plot.

#Lattice Panel Fns
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f*x+rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1))

# customized panel function
xyplot(y ~ x | f, panel = function(x,y,...){
  panel.xyplot(x,y,...) #call the default panel fn
  panel.abline(h = median(y), lty = 2) # add horiz line 
  }, layout = c(2,1))

# adding regression lines
xyplot(y ~ x | f, panel = function(x,y,...){
  panel.xyplot(x,y,...) #call the default panel fn
  panel.lmline(x,y,col = 2) # add horiz line 
}, layout = c(2,1))

## ggplot2 ##
library(ggplot2)
str(mpg)
