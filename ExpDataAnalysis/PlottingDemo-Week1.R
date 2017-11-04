# Week 1 Plotting Demo
x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x,y)
par(mar=c(4,4,2,2))
plot(x,y)
###
plot(x,y,pch=20)
example(points) #to see more about plotting points
title("Scatterplot")
text(-2,-2, "label")
legend("topleft", legend = "Data", pch = 20)
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd=3)
abline(fit, lwd = 3, col = "blue")

plot(x,y,xlab = "height", ylab = "age", main = "scatterplot", pch = 20)
legend("topright", legend = "Data", pch = 20)
fit <- lm(y ~ x)
abline(fit, lwd = 3, col = "red")

z <- rpois(100,2)
par(mfrow = c(2, 1))
plot(x, y, pch = 20)
plot(x, z, pcy = 20)

par("mar")
par(mar = c(2,2,1,1))
plot(x, y, pch = 20)
plot(x, z, pcy = 20)

par(mfrow = c(2,2))
plot (x, y)
plot (x, z)
plot (y, z)
plot (z, x)

##################

par(mfrow = c(1, 1))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2, 50)
g <- gl(2, 50, labels = c("Male", "Female"))
str(g)
plot(x,y)
# cannot tell what group they are in, so let's try this:
plot(x, y, type = "n")
points(x[g=="Male"], y[g=="Male"], col = "green")
points(x[g=="Female"], y[g=="Female"], col = "blue")
