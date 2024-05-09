library(tidyverse)
library(caret)
library(party)

dat <- read.table("~/Code/drive/R scripts/Classification_heart_disease/heart.csv", sep = ",", header = TRUE)

head(dat)
sapply(dat, function(x) table(is.na(x))) # Checking for missing values
table(duplicated(dat)) # Checking for duplicated rows
dat <- dat[!duplicated(dat), ] # Removing duplicated rows
dat$target <- dplyr::recode(dat$target, `0` = 1L, `1` = 0L) # Recoding target variable

dat %>%
  pivot_longer(everything(), names_to = "key", values_to = "value") %>%
  ggplot(aes(x = value)) +
  geom_histogram(fill = "steelblue", alpha = .7) +
  theme_minimal() +
  facet_wrap(~key, scales = "free")

# Correlation matrix
cormat <- cor(dat %>% keep(is.numeric))
cormat %>%
  as.data.frame() %>%
  mutate(var2 = rownames(.)) %>%
  pivot_longer(!var2, values_to = "value") %>%
  ggplot(aes(x = name, y = var2, fill = abs(value), label = round(value, 2))) +
  geom_tile() +
  geom_label() +
  xlab("") +
  ylab("") +
  ggtitle("Correlation matrix of our predictors") +
  labs(fill = "Correlation\n(absolute):")

# High correlation
highcorr <- which(cormat > .8, arr.ind = T)
paste(rownames(cormat)[row(cormat)[highcorr]],
  colnames(cormat)[col(cormat)[highcorr]],
  sep = " vs. "
) %>%
  cbind(cormat[highcorr])

# Boxplot showing the distribution of our predictors
dat %>%
  select(-c(sex, cp, ca, thal, restecg, slope, exang, fbs)) %>%
  pivot_longer(!target, values_to = "value") %>%
  ggplot(aes(x = factor(target), y = value, fill = factor(target))) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(size = .7, width = .1, alpha = .5) +
  scale_fill_manual(values = c("steelblue", "orangered1")) +
  labs(fill = "Heart disease:") +
  theme_minimal() +
  facet_wrap(~name, scales = "free")

# Stacked barplot showing the distribution of our predictors
dat %>%
  select(sex, cp, ca, thal, restecg, slope, exang, fbs, target) %>%
  pivot_longer(!target, values_to = "value") %>%
  ggplot(aes(x = factor(value), fill = factor(target))) +
  scale_fill_manual(values = c("steelblue", "orangered1")) +
  geom_bar(position = "fill", alpha = .7) +
  theme_minimal() +
  labs(fill = "Heart disease:") +
  facet_wrap(~name, scales = "free")

# Simple algorithm where if male, predict heart disease (1) else no heart disease (0)
pred <- as.factor(ifelse(dat$sex == 1, 1, 0))
confusionMatrix(pred, as.factor(dat$target)) # Accuracy = 0.62
