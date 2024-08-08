setwd("~/Code/drive/R scripts/Learn/Discirminant analysis/")
library(tidyverse)
library(caret)
theme_set(theme_classic())

insect <- read_csv("insect.csv")
head(insect)

insect %>% mutate(species = factor(species))
# Partition into test and train
# set.seed(123)
# samples <- sample(1:nrow(insect), 0.8*nrow(insect))
# train <- insect[samples, ]
# test <- insect[-samples, ]
train <- insect
test <- data.frame(joint1 = 194, joint2 = 124, aedeagus = 49)
library(heplots)
# Test for homogeneity
# boxM test variables on groups
boxM(cbind(
  insect$joint1, insect$joint2, insect$aedeagus),
  matrix(as.numeric(factor(insect$species)))
  )
# p value 0.132 no significant difference found between the variance
# covariance matrices
library(MASS)

m <- lda(formula = species ~ joint1 + joint2 + aedeagus , data = train, method = "mle")
plot(m) # plot of the linear discriminants
predictions <- predict(object = m, newdata = test) # make predictions on test data
names(predictions)
predictions

# plot predictions
lda.data <- cbind(train, predict(m)$x)
ggplot() +
  geom_point(aes(LD1, 0, color = species), data = lda.data) +
  geom_point(aes(color = predictions$class, x = predictions$x), y = 0) +
  ylim(0,0) +
  geom_hline(aes(yintercept=0, alpha = 0.1))

