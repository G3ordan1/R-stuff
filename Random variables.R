x <- 1:4; f <- c(0.4,0.3,0.2,0.1)
data <- sample(x,80,replace = TRUE, prob=f)
table(data)

x<- 0:5; f<- choose(13,x)*choose(39,5-x)/choose(52,5)
diamonds <- replicate(10000, sum(sample(c(rep(1,13),rep(0,39)),5)))
data.frame(x,f,table(diamonds))

#Give the mass function for the random variable X, the maximum of the roll of 2 independent dice.

x<- replicate(10000,max(sample(6,2,replace=TRUE)))
table(x)
round(c(1,3,5,7,9,11)/36,4)
