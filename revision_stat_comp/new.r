cost <- c(9, 9, 16)
s2 <- c(0.8 * 0.2, 0.25 * 0.75, 0.5 * 0.5)
N <- c(155, 62, 93)

first <- sum(N * sqrt(s2) / sqrt(cost))
second <- sum(N * sqrt(s2) * sqrt(cost))
third <- sum(N * s2)
n <- (first * second) / (sum(N)^2 * 0.1^2 / 4 + third)
n_s <- 0
for (i in 1:3) {
    n_s[i] <- n * (N[i] * sqrt(s2[i]) / sqrt(cost[i]) / first)
}
n_s
sum(n_s) == n

m <- matrix(c(5, 1, 1, 3), 2, 2)
cm <- chol(m)
# crossprod(cm)=t(cm) %*% cm #-- = 'm'
t(cm) %*% cm
crossprod(cm) #-- = 'm'

x <- matrix(c(1:5, (1:5)^2), 5, 2)
x <- cbind(x, x[, 1] + 3 * x[, 2])
colnames(x) <- letters[20:22]
m <- crossprod(x)

poisson_inv_transform <- function(lambda) {
  p.vec <- numeric(0)  # Initialize an empty probability vector
  k <- 0  # Initialize the count variable

  while (sum(p.vec) < 1) {
    k <- k + 1
    p.vec <- c(p.vec, exp(-lambda) * lambda^k / factorial(k))
  }

  # Use the modified inv.transform method with the constructed p.vec
  U <- runif(1)
  if (U <= p.vec[1]) {
    return(0)
  }
  for (state in 2:length(p.vec)) {
    if (sum(p.vec[1:(state-1)]) < U && U <= sum(p.vec[1:state])) {
      return(state)
    }
  }
}