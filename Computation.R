A<-matrix(c(1,0,0,1,3,0,4,5,2),3,3,byrow=T)
b<-c(1,1,2)
U <- t(A)
U
backsolve(U,b)
library(matrixcalc)
L <- lu.decomposition(A)$L
U <- lu.decomposition(A)$U
L%*%U == A

A<-matrix(c(2,1,2,1,4,0,2,0,5),3,3,byrow=T)
eigenValue <- eigen(A)$values
eigenVectors <- eigen(A)$vectors
U <- chol(A)
U
all.equal(t(U) %*% U,A)
A

library(ISwR)
library(matrixcalc)
data("cystfibr", package="ISwR")
Y <- matrix(cystfibr$pemax)
X <-as.matrix((cbind(1,cystfibr[c("age", "sex", "height", 
                                  "weight","bmp","fev1",
                                  "rv","frc","tlc")])))
A <- t(X)%*%X
A <- X%*%t(X)
U <- lu.decomposition(A)$U
L <- lu.decomposition(A)$L
round(L%*%U) == round(A)
A
all.equal(t(U)%*%U, L%*%U)

is.symmetric.matrix(A)
eigen(A)$values > 0
B <- t(X)%*%Y 

# Ab=B
# LUb=B
# LD=B Find D with forward substitution
# Ub=D Find b with backward substitution

D <- forwardsolve(L,B)
backsolve(U,D)
solve(A,B)

svd <- svd(A)
s <- svd$u
d <- diag(svd$d)
v <- svd$v
