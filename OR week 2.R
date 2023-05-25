s <- c(-10000,0)
p <- c(0.45,0.55)
f <- c(0.78,0.22)
large_s <- c(190000,-190000)
small_s <- c(90000,-30000)
nothing_s <- -10000
large <- c(200000,-180000)
small <- c(100000,-20000)
nothing <- 0
fav <- c(0.3,0.7)
EMV1 <- max(c(sum(f*large_s),
              sum(f*small_s),
              sum(f*nothing_s))) 
EMV1.5 <- sum(p * EMV1)
EMV2 <- max(c(sum(fav * large),
              sum(fav * small),
              sum(fav * nothing)))
EMV3 <- max(c(EMV1.5, EMV2))
print(EMV3)
if(EMV3 == EMV1){ 
  if(EMV1 == sum(f*large_s)){ 
    print("The best decision under EMV if positive is to build a large plant after doing a survey")
  }else if(EMV1 == sum(f*small_s)){
    print("The best decision under EMV if positive is to build a small plant after doing a survey")
  }else {
    print("The best decision under EMV if positive is to do nothing after doing a survey")
  }
}else{
  if(EMV2 == sum(fav * large)) {
    print("The best decision under EMV is to build a large plant after not doing a survey")
  }else if(EMV2 == sum(fav * small)) {
    print("The best decision under EMV is to build a small plant after not doing a survey")
  } else {
    print("The best decision under EMV is to do nothing after not doing a survey")
  }
}

matrix_probability <- t(matrix(c(p,p,p), ncol =3)) * matrix(c(f,f,f), ncol =3)
print(s[1] + matrix_probability * matrix(o, nrow=2, ncol=3, byrow=T))


sum(f*nothing)
sum(f * small)
