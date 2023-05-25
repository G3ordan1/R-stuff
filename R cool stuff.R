# fibonacci sequence
fib <- function(n) {
  results <- vector("numeric")
  results[c(1, 2)] <- 1
  for (i in 1:n) {
    results[i + 2] <- results[i] + results[i + 1]
  }
  return(results)
}
fib(13)

# originally this was a summation for loop that I tweaked haha
# ctr alt r to run everything
# ctr enter to run one line

# For loop using a function
# Define a function and store it in `compute_s_n`
compute_s_n <- function(n) {
  x <- 1:n
  sum(x^2)
}

# Create a vector for storing results
s_n <- vector("numeric", 25)

# write a for-loop to store the results in s_n
n <- 25
for (i in 1:n) {
  s_n[i] <- compute_s_n(i)
}
# edx test
library(dslabs)
data(heights)
number <- ifelse(heights$sex == "Female", 1, 2)
sum(number)
tall <- ifelse(heights$height > 72, heights$height, 0)
mean(tall)
inches_to_ft <- function(x) {
  x / 12
}
inches_to_ft(144)
sum(inches_to_ft(heights$height) < 5)

# Practice on plots
plot(x = results, y = x)
hist(results, freq = FALSE)
boxplot(x, results, horizontal = TRUE, col = blue)
quantile(results, c(0.25, 0.75))

# Applying log x to results lapply(log(x), results)
