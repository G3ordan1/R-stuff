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

# Calculate the average repair cost per saw for each industry
data <- data %>% mutate(Average_Repair_Cost_Per_Saw = Total_Repair_Cost / Number_of_Saws)

# Calculate the sample mean and sample variance of repair costs per saw
sample_mean <- mean(data$Average_Repair_Cost_Per_Saw)
sample_variance <- var(data$Average_Repair_Cost_Per_Saw)

# (ii) Estimate the total amount spent by the 96 industries on band saw repairs and its variance:

# Calculate the total amount spent by all 96 industries
total_cost_all <- sum(data$Total_Repair_Cost)

# Calculate the estimated total amount spent based on cluster sampling
estimated_total_amount <- sample_mean * sum(data$Number_of_Saws)

# Calculate the variance of the estimated total amount spent

# Calculate f (fraction of clusters sampled)
f <- n / N

# Calculate f_corr (finite population correction factor)
f_corr <- (N - n) / (N - 1)

# Assumed variance of the cluster means
V_c <- 0.1 * sample_variance

# Calculate the variance of the estimated total amount spent
variance_estimate <- (N^2 / n) * ((1 - f) * (1 - f_corr) * sample_variance + f * (n - 1) * V_c)

# Print the results
cat("Average Repair Cost per Saw (Sample Mean):", sample_mean, "\n")
cat("Variance of Repair Costs per Saw (Sample Variance):", sample_variance, "\n")
cat("Estimated Total Amount Spent by 96 Industries:", estimated_total_amount, "\n")
cat("Variance of Estimated Total Amount:", variance_estimate, "\n")
