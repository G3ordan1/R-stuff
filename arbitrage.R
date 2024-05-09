r_h <- 0.1
r_f <- 0.02

e_t0 <- 1 / 150 # 1 USD = 150 CNY
forward_rate <- 1 / 140 # 1 USD = 140 CNY so it appreciates
e_t1 <- e_t0 * (1 + r_h) / (1 + r_f)
change_in_er <- (e_t1 - e_t0) / e_t0
change_in_forward <- (forward_rate - e_t0) / e_t0
data.frame(change_in_er, change_in_forward, difference = change_in_er - change_in_forward)
# so forward rate USD gives more CNY in the future than interest rate difference.
r_h - r_f # postive differential, domestic currency is supposed to depreciate more than what forward_rate is expecting

borrow <- 10000 * 150 # Borrow value of $10 000 usd in CNY
interest <- borrow * (r_f)
deposit <- 10000 * (1 + r_h) # Lends to get higher rate
convert <- deposit * 1 / forward_rate # Changes back
profit <- convert - (borrow + interest)
profit
# if forward rate was e_t1
convert <- deposit * 1 / e_t1
profit <- convert - (borrow + interest)
profit

# Interest rate parity
(r_h - r_f) / (1 + r_f) == e_t1 - e_t0
