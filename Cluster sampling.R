# Load the dplyr package
library(dplyr)

# Create a data frame with the given data
data <- data.frame(
  Industry = 1:20,
  Total_Repair_Cost = c(50, 11, 230, 140, 60, 280, 240, 45, 60, 230, 140, 130, 70, 50, 10, 60, 280, 150, 110, 120),
  Number_of_Saws = c(3, 7, 11, 9, 2, 12, 14, 3, 5, 9, 8, 6, 3, 2, 1, 4, 12, 6, 5, 8)
)

# Sample size (n) and total number of industries (N)
n <- 20
N <- 96

# (i) Estimate the average repair cost per saw for the past month and its variance:

# s2r <- sum((data$Total_Repair_Cost - ybar * data$Number_of_Saws)^2) / (n - 1)
# var_ybar <- s2r / (sum(data$Number_of_Saws)^2 / n) * (1 - n / N)

sum_yi <- sum(data$Total_Repair_Cost)
sum_mi <- sum(data$Number_of_Saws)
sum_mi2 <- sum(data$Number_of_Saws^2)
sum_yi2 <- sum(data$Total_Repair_Cost^2)
sum_yimi <- sum(data$Total_Repair_Cost * data$Number_of_Saws)

ybar <- sum_yi / sum_mi
s2r <- (sum_yi2 - 2 * ybar * sum_yimi + ybar^2 * sum_mi2) / (n - 1)
var_ybar <- s2r / (sum_mi^2 / n) * (1 - n / N)

# (ii) Estimate the total amount spent by the 96 industries on band saw repairs and its variance:

# Calculate the total amount spent by all 96 industries
ybar_t <- sum_yi / n
total_cost <- N * ybar_t

# Calculate the variance of the estimated total amount spent
s2t <- 1 / (n - 1) * sum((data$Total_Repair_Cost - ybar_t)^2)
var_total_cost <- N^2 * (1 - n / N) * s2t / n

confidence_interval_total <- c(
  total_cost - qt(0.975, 19) * sqrt(var_total_cost),
  total_cost + qt(0.975, 19) * sqrt(var_total_cost)
)
string_confidence_interval <- paste0("(", round(confidence_interval_total[1], 2), ", ", round(confidence_interval_total[2], 2), ")")
# Print the results
cat("Average Repair Cost per Saw:", ybar, "\n")
cat("Variance of Repair Costs per Saw:", var_ybar, "\n")
cat("Estimated Total Amount Spent by 96 Industries:", total_cost, "\n")
cat("Variance of Estimated Total Amount:", var_total_cost, "\n")
cat("95% Confidence Interval for Total Amount Spent:", string_confidence_interval, "\n")


random <- rnorm(1000, 150, 20)
samples <- list("mean" = rep(0, 1000), "sd" = rep(0, 1000))
for (i in 1:1000) {
  sample <- sample(random, 30, replace = TRUE)
  samples$mean[i] <- mean(sample)
  samples$sd[i] <- sd(sample)
}

conf_int <- list(0)
for (i in 1:1000) {
  conf_int[[i]] <- c(samples$mean[i] - 1.96 * samples$sd[i], samples$mean[i] + 1.96 * samples$sd[i])
}

conf_int <- unlist(conf_int)
conf_int <- matrix(conf_int, nrow = 1000, ncol = 2, byrow = TRUE)


sum(conf_int[, 1] < 150 & conf_int[, 2] > 150) / 1000
