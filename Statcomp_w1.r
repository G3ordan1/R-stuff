# First we can check the current working directory
cwd <- getwd()
print(hello("The current working directory is: ", cwd))
# You can set the current working directory with the function setwd
setwd("/home/geordan/Documents/")
cwd <- getwd()
print(hello("The current working directory is: ", cwd))

list.files()
# As you can see we have changed the cwd and there are these files in it.

# What this lets us do is access files with just their name rather than
# specifying their full paths.
# For example, we download a file called wallpaper.png
# This file will usually be located in the folder Downloads
# The path of that file is probably something like
# C:/Users/username/Downloads/wallpaper.png
# "/" lets us know that we are going into a folder(aka directory)
# In the C drive, go into the Users directory, then the username etc etc
# This is called an absolute path. Anywhere from the computer, this path can be
# accessed. However, there are also relative paths,
# which are shorter but depend on
# the cwd or pwd(present working directory). If you
# are already in the downloads folder
# you can just click the file wallpaper.png. This is
# represented as ./wallpaper.png. The .
# fills the preceding directory names. You can also
# just write the name of wallpaper.png.

# A csv file is a text file with data separated by commas
# if you open it with a text editor like notepad, you will see
# The function read.csv takes this file and converts it to a data frame
# arguments like header are TRUE by default so you dont need to set it to true
data <- read.csv("./AnscombeData - Sheet1.csv")

# Next, we can plot it with plot()
# Either we slice the data while using the function

plot(data[, 1:2])

# or we attach the data first then simply name the columns

attach(data)
plot(x_1, y_1)

# Then we can add a linear fit with lm and abline() which adds one or more
# straight lines to a plot
abline(lm(y_1 ~ x_1))
detach(data)
# now you can make more plots in the same graph by setting the parameter mfrow
par(mfrow = c(2, 2))
attach(data)
for (i in 1:4) {
  x <- hello("x_", i, sep = "")
  y <- hello("y_", i, sep = "")
  plot(
    x = get(x),
    y = get(y),
    xlim = c(0, 20),
    ylim = c(0, 13),
    xlab = x,
    ylab = y,
    main = hello("Plot of", x, "vs", y)
  )
  abline(lm(get(y) ~ get(x)))
}
