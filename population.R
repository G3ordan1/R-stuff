Y <- sample(0:1, 100, replace = TRUE)
Y
y <- sample(Y, 10)
y
P <- sum(Y) / length(Y)
Q <- 1 - P

p <- sum(y) / length(y)
q <- 1 - p

data.frame("Pop" = c(P, Q), "Sample" = c(p, q))

var_p <- p * q / (length(y) - 1) * (1 - length(y) / length(Y))
var_p

VAR_P <- P * Q / length(Y)
VAR_P

ifelse(var_p > VAR_P,
    "Sample variance is greater than population variance",
    "Sample variance is less than population variance"
)
