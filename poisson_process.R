library(ggplot2)
os <- tolower(Sys.info()["sysname"])
home <- ifelse(os == "windows", Sys.getenv("R_USER"), Sys.getenv("HOME"))
make_sample_df <- function(run, tmax, lambda) { # Takes in each run (Enables multiple runs on a simgle plot), tmax for target duration, lamda for mean
  x <- 0 # Initializing x
  while (sum(x) < tmax) x <- c(x, rexp(1, lambda)) # Creates a vector of random exp var until their sum reaches target
  data.frame(t = cumsum(x), N = seq_along(x), run = rep(run, length(x))) # Put in a dataframe the count t, N as 1:N, and run as [run, run, ... ]
}

plot_poisson <- function(runs, tmax, lambda) {
  # Creates one data frame for each run, this sticks them all together:
  df <- do.call("rbind", lapply(seq(runs), make_sample_df, tmax, lambda)) # via row bind of each output of apply 1:however many runs using previous function and passing tmax and lambda

  ggplot(data = df, mapping = aes(t, N, group = run)) + # Grouping by run of df
    geom_step(alpha = 0.25) + # geom_step for step plot
    labs(title = paste(runs, "runs of Poisson process with lambda", lambda)) + # Add title
    theme(legend.position = "none") + # Remove legend of run
    coord_cartesian(xlim = c(0, tmax)) # X axis
}

plot_poisson(runs = 10, tmax = 100, lambda = 0.7)
ggsave(paste0(home, "/Documents/poisson.png"))


lambda <- 0.5
T_length <- 31 # the length of time horizon for the simulation
last_arrival <- 0 # T_n-1
arrival_time <- c() # Vector of Ts
inter_arrival <- rexp(1, rate = lambda) # Time between poisson events follow exponential distribution
while (inter_arrival + last_arrival < T_length) { # Loop until time T_n
  last_arrival <- inter_arrival + last_arrival
  arrival_time <- c(arrival_time, last_arrival)
  inter_arrival <- rexp(1, rate = lambda)
}
n <- length(arrival_time)
counts <- seq(arrival_time)

png(paste0(home, "/Documents/poisson_trajectory.png"))
plot(arrival_time, counts, pch = 16, ylim = c(0, n))
points(arrival_time, c(0, counts[-n]))
segments(
  x0 = c(0, arrival_time[-n]),
  y0 = c(0, counts[-n]),
  x1 = arrival_time,
  y1 = c(0, counts[-n])
)
dev.off()

mean(c(1, 2, 3), na.rm = T)
