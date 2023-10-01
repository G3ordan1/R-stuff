library(readr)
library(ggplot2)
library(dplyr)

history <- read_csv("History.csv")
df <- data.frame(history)
df["Date.UTC."] <- as.Date(df[, "Date.UTC."])
glimpse(df)
names(df)[1] <- "date"
names(df)
df1 <- df %>% filter(type == "REALIZED_PNL")
glimpse(df1)
cum_amount <- c(df1[1, "Amount"], rep(0, 28))
for (i in 2:length(df1[, "Amount"])) {
    cum_amount[i] <- sum(df1[i, "Amount"], cum_amount[i - 1])
}
df1["cum_amt"] <- cum_amount
plot <- ggplot(df1) +
    geom_point(data = df1, aes(date, Amount)) +
    geom_line(aes(date, cum_amt), colour = "red", data = df1) +
    geom_hline(yintercept = 0) +
    geom_smooth(aes(date, Amount), colour = "blue", data = df1, method = "lm", se = FALSE)
print(plot)
sum(df1["Amount"] > 1)
sum(df1["Amount"] < 1)
sum(df1["Amount"])
