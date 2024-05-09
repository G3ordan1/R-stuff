library(dplyr)
df <- read.table("~/Downloads/cuse.txt", header = 1)
idx <- rep(seq_along(df), df[["Total"]])
dupdf <- df[idx, ]
tail(df)
row.names(dupdf) <- NULL
df <- dupdf %>% select(1:4)

for (i in seq_along(names(df))) {
  df[i] <- factor(df[[i]])
}
str(df)
# one predictor model
model <- glm(Use ~ Desire, family = "binomial", data = df)
summary(model)
names(model)
head(contraceptive_data)


m0 <- glm(Use ~ 1, family = binomial, data = df)
summary(m0)
m1 <- glm(Use ~ Desire, family = binomial, data = df)
summary(m1)
m2 <- glm(Use ~ Age + Desire, family = binomial, data = df)
summary(m2)
m2_interaction <- glm(Use ~ Age / Desire, family = binomial, data = df)
summary(m2_interaction)
