Ni <- c(112, 68, 39)
s2i <- c(2.25, 3.24, 3.24)
ci <- c(9, 25, 36)

n <- (700 * sum(Ni * sqrt(s2i / ci))) / sum(Ni * sqrt(s2i * ci))
ni <- Ni * sqrt(s2i / ci) / sum(Ni * sqrt(s2i / ci)) * ceiling(n)
cat("n is", ceiling(n), "and ni is", ceiling(ni), "\n")

Ni <- c(20000, 10000, 35000, 15000)
si <- c(4, 3, 2, 3)
ci <- c(5, 2, 4, 3)
s2i <- si^2

n <- (6000 * sum(Ni * sqrt(s2i / ci))) / sum(Ni * sqrt(s2i * ci))
ni <- Ni * sqrt(s2i / ci) / sum(Ni * sqrt(s2i / ci)) * ceiling(n)
cat("n is", ceiling(n), "and ni is", ceiling(ni), "\n")
