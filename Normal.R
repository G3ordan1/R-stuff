# Creating a random variable x normal dist of 100 numbers and mean 100, sd 10
x <- rnorm(100, 100, 10)
xs <- sort(x)
y <- dnorm(xs, 100, 10)
plot(xs, y, type = "l")
h <- hist(xs)

x <- seq(0, 10, 0.01)
f <- pgamma(x, shape = 9, rate = 2)
plot(f)
max(f)
y <- dgamma(x, shape = 9, rate = 2)
plot(y)
plot(x, f)
df <- data.frame(x, y, f)

x <- seq(40, 160, 1)
y <- dnorm(x, 100, 15)
sd <- 15
plot(x, y, type = "l", xaxt = "n", yaxt = "n")
axis(1, at = c(100 - 3 * sd, 100 - 2 * sd,
             100 - sd, 100 + sd, 100 + 2 * sd,
              100 + 3 * sd))
