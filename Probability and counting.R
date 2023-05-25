# create a vector of n 1s
n <- 60
prob <- rep(1, n)
# Prob of n people not having the same birthday
for (k in 2:n) {
  prob[k] <- prob[k - 1] * (365 - k + 1) / 365
}
# plot of n people against prob that at least 2 have the same birthday
plot(1:n, 1 - prob,
  xlab = "number of people",
  ylab = "probability of same birthday"
)
# showing the data points
data.frame(1:n, 1 - prob)

# Pascal's triangle
pascal <- matrix(numeric(64), nrow = 8)
pascal[, 1] <- 1
for (n in 2:8) {
  for (k in 2:n) {
    pascal[n, k] <- pascal[n - 1, k] + pascal[n - 1, k - 1]
  }
}
# Distribution function of probability of choosing 5 cards in a pack of
# 52 cards with at least 1 diamond.
x <- -1:6
f <- choose(13, x) * choose(39, 5 - x) / choose(52, 5)
data.frame(f)
F <- cumsum(f)
plot(x, F, type = "s")

n <- 0:50
x <- numeric(max(n))
for (k in n) {
  x[k + 1] <- choose(max(n), k)
}
print(x)

ggplot(mtcars, aes(x = seq)) +
  stat_function(
    fun = dnorm,
    args = with(mtcars, c(mean = mean(mpg), sd = sd(mpg)))
  ) +
  scale_x_continuous("Miles per gallon")

# Generating a geometric distribution of rv with p=1/3
x <- 0:10
f <- dgeom(x, 1 / 3)
F <- pgeom(x, 1 / 3)
print(data.frame(x, f, F))
