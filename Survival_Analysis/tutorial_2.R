redskin <- read.table("redskin.txt", header = TRUE)
redskin <- sort_by.data.frame(redskin, redskin$Time)
redskin_product <- redskin[redskin$Group == "Product", ]
redskin_placebo <- redskin[redskin$Group == "Placebo", ]
library(KMsurv)
library(survival)
redskin_product_s <- survfit(with(redskin_product, Surv(Time, status))~1)
redskin_placebo_s <- survfit(with(redskin_placebo, Surv(Time, status))~1)
plot(redskin_product_s, col="blue", conf.int = FALSE, mark.time=TRUE, xlim = c(0,20))
lines(redskin_placebo_s, col = "red", conf.int=FALSE, mark.time=TRUE)
text(locator(), labels = c("Product", "Placebo"))
abline(
  h = seq(0,1,0.1),
  v = seq(0, 20, 1),
  lty = 3,
  col = "lightgray")

plot(redskin_product_s$time, redskin_product_s$surv, col="blue", xlim = c(0,20), type = "b")
lines(redskin_placebo_s$time, redskin_placebo_s$surv, col = "red", type = "b")
text(locator(), labels = c("Product", "Placebo"))
abline(
  h = seq(0,1,0.1),
  v = seq(0, 20, 1),
  lty = 3,
  col = "lightgray")

survdiff(with(redskin, Surv(Time, status))~redskin$Group)

# Call:
# survdiff(formula = with(redskin, Surv(Time, status)) ~ redskin$Group)

# N Observed Expected (O-E)^2/E (O-E)^2/V
# redskin$Group=Placebo 8        7     3.13      4.80      10.2
# redskin$Group=Product 6        4     7.87      1.91      10.2

# Chisq= 10.2  on 1 degrees of freedom, p= 0.001

# Reject H0 if X_t 6.71 > X_1,0.05 = 3.84 Evidence 2 surv curves diff