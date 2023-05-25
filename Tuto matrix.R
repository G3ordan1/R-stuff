A<-matrix(c(1,-1,0,-1,2,-1,0,-1,1),3,3,byrow=T)
A
library("matrixcalc")
D<-diag( eigen(A)$values,nrow(A));

system.time(crossprod(1:10^6,1:10^6));
system.time(t(1:10^6)%*%(1:10^6));

x<- list(a = 1:10, beta = exp(-3:3))

lapply(x,mean)
lapply(x,quantile)

sapply(x,mean)
sapply(x,quantile)