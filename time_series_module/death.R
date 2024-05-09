deaths <-  scan("./time_series_module/deaths.txt", skip = 4)
deaths |> ts(start = 2003, frequency = 12) -> deaths
monthplot(deaths, labels = month(1:12, label = TRUE), ylab = "Number of deaths")
plot(deaths) #Honestly the default plot is kinda shaite
quarterly <- aggregate(deaths, nfrequency = 4)
quarterly
deaths

library(fpp3) #Here comes the big boii
deaths <- as_tsibble(deaths)
deaths %>% gg_season(value) +
  labs(x = "Months",
       y = "Deaths", 
       title = "Number of deaths per month")
