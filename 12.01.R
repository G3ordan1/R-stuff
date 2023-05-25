A <- matrix(c(1, 2, 1, 3, 2, 2, 5, 2, 1), 3, 3, byrow = T)
b <- c(0, 2, 1)
library(matrixcalc)
x <- lu.decomposition(A)
x
L <- x$L
forwardsolve(A, L)
A <- matrix(runif(9, 0, 1), 3, 3)
t(A) %*% A

# matrix symmetric and positive definite
# positive definite matrix is when the eigenvalues are all positive
A <- matrix(c(2, 1, 2, 1, 4, 0, 2, 0, 5), 3, 3, byrow = T)
# chol(A)= L%*%t(L)
u <- chol(A)
# or
# chol(A)=t(U)%*%U

# Solving equation using cholesky, LU
