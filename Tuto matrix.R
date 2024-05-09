A <- matrix(c(1, -1, 0, -1, 2, -1, 0, -1, 1), 3, 3, byrow = T)
A
library("matrixcalc")
D <- diag(eigen(A)$values, nrow(A))
t1 <- system.time(crossprod(1:10^6, 1:10^6))
t2 <- system.time(t(1:10^6) %*% (1:10^6))

print(c(t1, t2, t1 - t2))
x <- list(a = 1:10, beta = exp(-3:3))

lapply(x, mean)
lapply(x, quantile)

sapply(x, mean)
sapply(x, quantile)

