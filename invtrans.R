poisson_inv_transform <- function(lambda) {
  n <- 0
  poisson <- function(x, lambda) {
    return(lambda ^ x / factorial(x) * exp(-lambda))
  }
  pp <- poisson(0, lambda)
  u <- runif(1)
  if (u <= pp) {
    return(n)
  }
  while (u > pp) {
    n <- n + 1
    pp <- pp + poisson(n, lambda)
  }
  return(n)
}

gen <- function(n, lam) {
  x <- numeric(0)
  for (i in 1:n) {
    x <- c(x, poisson_inv_transform(lam))
  }
  return(x)
}

x <- numeric(0)
x <- c(x, gen(1000, 2))
hist(gen(100, 2))
