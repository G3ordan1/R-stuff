sixmp <- read.table("6MP_clinical_trial.txt", header = TRUE, sep = " ")
army <- read.table("army.txt", skip = 1, header = TRUE, sep = " ")
tumour <- read.table("tumour.txt", header = TRUE, sep = " ")
# write.table(x = sort_by.data.frame(sixmp, sixmp$Patient_code), file = "6MP_clinical_trial.txt", row.names = FALSE)
library(dplyr)
sixmp_six <- sixmp %>% filter(Drug == "6-MP")
sixmp_six <- sort_by.data.frame(sixmp_six, sixmp_six$Remission_time_weeks)
sixmp_placebo <- sixmp %>% filter(Drug == "Placebo")
sixmp_placebo <- sort_by.data.frame(sixmp_placebo, sixmp_placebo$Remission_time_weeks)
library(survival)
library(KMsurv)
sixmp_six_survival_object <- with(sixmp_six, Surv(Remission_time_weeks, status))
sixmp_placebo_survival_object <- with(sixmp_placebo, Surv(Remission_time_weeks, status))

estimates_sixmp_six <- survfit(sixmp_six_survival_object ~ 1)
summary(estimates_sixmp_six)

estimates_sixmp_placebo <- survfit(sixmp_placebo_survival_object ~ 1)
summary(estimates_sixmp_placebo)

plot(
  estimates_sixmp_six,
  conf.int=FALSE,
  mark.time=TRUE,
  col = "blue",
  xlab = "Remission time",
  ylab = "Survival",
  main = "Kaplan Meier Curves for Placebo and 6-MP")
lines(estimates_sixmp_placebo,conf.int=FALSE, mark.time=TRUE, col = "red")
text(locator(), labels = c("6-MP", "Placebo"))
abline(
  h = seq(0,1,0.1),
  v = seq(0, 35, 1),
  lty = 3,
  col = "lightgray")

survdiff(with(sixmp, Surv(Remission_time_weeks, status))~sixmp$Drug)
qchisq(0.05, 1, lower.tail = FALSE)
# [1] 3.841459
# Reject H0 X_t  > X_1,0.05
# nowork ------------------------------------------------------------------
tumour_time <- numeric(0)
for (i in 1:10) { tumour_time <- c(tumour_time, rep(i, (tumour$c+tumour$d)[i])) }
tumour_time
tumour_status <- numeric(0)
for (i in 1:10) { tumour_status <- c(tumour_status, rep(0, tumour$c[i]), rep(1, tumour$d[i])) }
tumour_status
tumour_survival_object <- Surv(time = tumour_time, event = tumour_status)
plot(tumour_survival_object)
summary(survfit(tumour_survival_object~1))
abline(
  h = seq(0,1,0.1),
  v = seq(0, 10, 1),
  lty = 3,
  col = "lightgray")


# manually ----------------------------------------------------------------

tumour["I"] <- 1:10
tumour["n"] <- 374
for (i in 2:10) { tumour[i, "n"] <- (tumour[i-1, "n"] - tumour$c[i-1] - tumour$d[i-1]) }
tumour["n_dash"] <- tumour["n"] - 1/2*tumour["c"]
tumour["S_t"] <- 1 - tumour["d"] / tumour["n_dash"]
for (i in 2:10) { tumour[i, "S_t"] <- (tumour[i-1, "S_t"] * tumour[i, "S_t"]) }
tumour_interval <- c(0, tumour[, "I"] - 1)
tumour_S_t <- c(1.0, tumour[, "S_t"])

plot(tumour_interval, tumour_S_t, type = "s")
points((4:10-0.5), tumour_S_t[5:11], pch = 3)
abline(
  h = seq(0,1,0.1),
  v = seq(0, 10, 1),
  lty = 3,
  col = "lightgray")

tumour_interval <- c(0, tumour[, "I"])
plot(tumour_interval, tumour_S_t, type = "b", ylim = c(0,1), main = "Survival fit")
abline(
  h = seq(0,1,0.1),
  v = seq(0, 10, 0.5),
  lty = 3,
  col = "lightgray")

# Army -------------------------------

army_t <- 0:4
army_n <- 506
army_d <- c(0, army$ndy)
army_c <- c(0, army$nly)
for (i in 2:5) { army_n[i] <- army_n[i-1] - army_d[i-1] - army_c[i-1]}
army_n_dash <- army_n - 1/2*army_c
army_S_t <- 1 - army_d / army_n_dash
for (i in 2:5) {army_S_t[i] <- army_S_t[i-1] * army_S_t[i]}
plot(
  army_t, army_S_t, type = "b", ylim = c(0,1),
  main = "Survival fit", ylab = "S_t", xlab = "Time"
)

abline(
  h = seq(0,1,0.1),
  v = seq(0, 4, 0.1),
  lty = 3,
  col = "lightgray")
