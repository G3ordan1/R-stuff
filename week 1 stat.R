#random normal
set.seed(18)
n<-3 + rnorm(1,0,1)
n
#random poisson
set.seed(9)
rpois(10,2)
#Sequence of length 10 from 1 to 15
x<-seq(length=10, from = 1, to = 15)
#Concatenates 2 sequences 1:9 and 1:10
sequence(c(9,10))
#Factor alphabet from a sample of 100 letters then making a data frame to show which letters are in which category.
L <- sample(LETTERS,100,replace=T)
LF <- factor(L,labels=c(rep("first 6",6),rep("second 6",6),rep("third 6",6),rep("last 8",8)));
LF
data.frame(L,LF)
#Matrix 2 by 3 
matrix(1:6, 2,3);
#Matrix 2 by 3 but fills rows first
matrix(1:6,2,3,byrow=TRUE);
#Transpose matrix with t()
t(matrix(1:6,2,3,byrow=TRUE))
#another way to make an array
x<-1:15
dim(x)<-c(5,3)
x

y<-1:4
M<-c(10,35)
data.frame(y,M);
z<-1:4;
a<-rep(3,5);
L1<-list(A=z,B=a);
L1
A<-matrix(c(1:9),3,3)
# Verify:
  t(A)%*%A
crossprod(A)
det(A)
eigen(A)
