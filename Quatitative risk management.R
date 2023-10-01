# install.packages('qrmdata')
# install.packages('xts')
library(qrmdata)
library(xts)
library(styler)
style_file()
data(data = "DJ", package = "qrmdata")
head(DJ)
tail(DJ)
plot(DJ)
# Subset for the year 2008 2009
dj0809 <- DJ["2008-01-01/2009-12-31"]
plot(dj0809)

# xts examples
xts1 <- xts(x = 1:10, order.by = Sys.Date() - 1:10)
xts1
data <- rnorm(5)
dates <- seq(as.Date("2017-05-01"), length = 5, by = "days")
dates
xts2 <- xts(x = data, order.by = dates)
xts2
xts3 <- xts(x = rnorm(10), order.by = as.POSIXct(Sys.Date() + 1:10), born = as.POSIXct("1899-05-08"))
xts3
xts4 <- xts(x = 1:10, order.by = Sys.Date() + 1:10)
xts4

# Load DJ constituents data
data(DJ_const)

# Apply names() and head() to DJ_const
names(DJ_const)
head(DJ_const)
tail(DJ_const)
# Extract AAPL and GS in 2008-09 and assign to stocks
stocks <- DJ_const["2008/2009", c("AAPL", "GS")]

# Plot stocks with plot.zoo()
plot.zoo(stocks)
