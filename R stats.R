#Input data for index, no_factories and mat_type
index <- c(10, 20, 10, 10, 24, 17, 38, 32, 16, 15, 8, 7)
no_factories <- c(1, 2, 1, 1, 2, 1, 3, NA, 2, 2, 1, 1)
mat_type <- c("bio", "bio", "bio", "non-bio", "non-bio", "bio", "non-bio", "non-bio", "non-bio", "bio", "non-bio", "bio")
#Finding the value of NA using mean or regression
mean(no_factories)
summary(lm(no_factories~index))
0.46636+0.06783*32
#create new no_factories without NA
no_factories_r <- c(1, 2, 1, 1, 2, 1, 3, 2.63692, 2, 2, 1, 1)
#regression for index on no_factories_r
summary(lm(index~no_factories_r))
#correlation coefficient of the regression
cor(index,no_factories_r)
#Just a for loop cause Im lazy to create a new vector of dummy_mat with code 1 for bio and 0 for non-bio
dummy_mat <- vector("numeric", length = 12)
for(i in 1:12) {
  if(mat_type[i]=="bio"){ 
    dummy_mat[i] <- 1
  } else { 
      dummy_mat[i] <- 0
    }
}
#linear regression for index on dummy_mat
summary(lm(index~dummy_mat))

#using gsub and as.numeric
dmat <- gsub("non-bio", 0, mat_type)
dmat <- as.numeric(gsub("bio", 1, dmat))