library(data.table)
dt <- fread('datasets/pottery.csv')

head(dt)
fit <- lm(as.numeric(factor(dt[, site])) ~ dt[, al])
hist(fit$residuals)
table(dt[,al], dt[,site])
hist(dt[,al-mean(al),site][,V1])
dtib <- tibble(dt)
modified <- dtib %>% group_by(site) %>% select(!site) %>% 
  mutate(across(everything(), ~ . - mean(.)))
head(modified)
hist(modified$al)
hist(modified$fe)
hist(modified$mg)
hist(modified$ca)
hist(modified$na)

modified %>% group_by() %>% select(!site) %>% pairs()
# Load the necessary library
library(dplyr)

# Create a sample data frame
data <- tibble(
  group = rep(c('A', 'B', 'C'), each = 4),
  value1 = rnorm(12, mean = 10, sd = 2),
  value2 = rnorm(12, mean = 20, sd = 3),
  value3 = rnorm(12, mean = 30, sd = 4)
)

# View the sample data
print(data)

# Group the data by the 'group' variable and compute the values in other columns minus the mean by the grouped variable
result <- data %>%
  group_by(group) %>%
  mutate(across(starts_with("value"), ~ . - mean(.)))

# View the result
print(result)
data%>% select(group,value1) %>% group_by(group) %>% print()
#epsilon <- 
pairs(modified[,2:6])
modified <- data.table(modified)
modified.nooutlier <- data.table(modified)[na < 0.2 & mg < 2 & fe > -2,]
hist(modified.nooutlier$fe)
pairs(modified.nooutlier[,2:6])

# Test if there's a common variance covariance matrix
library(heplots)
heplots::boxM(dt[,al:na],factor(dt[,site]))

filtered_pottery <- dt %>%
  group_by(site) %>%
  filter(n() >= 5)
filtered_pottery
heplots::boxM(filtered_pottery[,2:6],filtered_pottery$site)

iris %>% 
  group_by(Species) %>% 
  reframe(n())
dt %>% 
  group_by(site) %>% 
  reframe(n())

pottery <- readr::read_csv("datasets/pottery.csv")
DFA.CANCOR::HOMOGENEITY(pottery,"site",c("al", "fe", "mg", "ca", "na"))
summary(manova(cbind(al, fe, mg, ca, na) ~ site, data = pottery))
