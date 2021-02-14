z <- c(1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0)
m <- scale(z)
sd(m)
mean(m)
attr(m,"scaled:center")
scale(z)
scale(z, scale=FALSE)
softmax <- function(x) {
  res <- exp(x) / sum(exp(x))
  return(res)
}
round(softmax(z), 5)
require(ggplot2) ## load 'mpg' data set
boxplot(hwy ~ class, data=mpg)
require(lattice)
p <- bwplot(hwy ~ class, data=mpg)
p
require(ggplot2)
p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()
require(latticeExtra)
p <- xyplot(cty ~ displ | drv, data=mpg,
            panel=function(x,y, ...) {
              panel.grid(h=-1, v=-1)
              panel.xyplot(x,y,...)
              panel.lmline(x,y,col="red", ...)
              panel.smoother(x,y, col="darkblue", ...)
            })
p

require(ggplot2)
p <- ggplot(mpg, aes(displ, cty)) + geom_point()
p + facet_grid(drv ~ .) + geom_smooth()
