#1 
data <- round(rnorm(300, 5, 3))
#2 sampling
sample(10)
sample(10, replace=T)
resamples <- lapply(1:20, function(i) sample(data, replace = T))
#3
r.median<-sapply(resamples,median)
num <- 20; b.median <- function(data, num) {
  resamples <- lapply(1:num, function(i) sample(data, replace=T))
  r.median <- sapply(resamples, median)
  std.err <- sqrt(var(r.median))
  list(std.err=std.err, resamples=resamples, medians=r.median)
}
#5
statistics<-sort(b.median(data,num)$medians); 
# to put in order
quantile(statistics, prob=c(0.025,0.975))