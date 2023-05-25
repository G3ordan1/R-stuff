usr_input <- readline(prompt = "Input number: ")
num <- as.integer(usr_input)
factorial <- 1
if (num < 0) {
  print("Sorry, no factorial for the number")
} else if (num == 0) {
  print("Factorial is 1")
} else {
  for (i in 1:num) {
    factorial <- factorial * i
  }
  print(paste("the factorial of", num, "is", factorial))
}

fact <- function(num) {
   facto  <- 1
   if (num < 0) {
    print("Sorry, no factorial for the number")
   }else {
     for (i in 1:num) {
       facto <- facto * i
     }
   return(facto)
   }
}
print(fact(24) / fact(12))