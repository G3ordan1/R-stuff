# standard algorithm to generate any discrete r.v
#from the discrete analogue of the inverse transformation method


rpoisGen<-function(n,lambda)
{
  
  respois<-rep(0,n);
  for(j in (1:n))
  {
    i = 0;
    U = runif(1);
    cdf = exp(-lambda); #P(i=0)
    while(U >= cdf)
    {i = i + 1;
    cdf = cdf + exp(-lambda) * lambda^i/gamma(i + 1);  # Poisson formula }
    respois[j] = i;
    }
  }
  
  return(respois);
  
}

#---------------------------------------- Geometric r.v-------------------------

rgeomGen<-function(n,p)
{
  
  resgeom<-rep(0,n);
  for(j in (1:n))
  {
    i = 0;
    U = runif(1);
    cdf = p; #P(i=0)
    while(U >= cdf)
    {i = i + 1;
    cdf = cdf + p*(1-p)^i;  # geometric formula }
    resgeom[j] = i;
    }
  }
  
  return(resgeom);
  
}

library(MASS)
par(mfrow=c(1,2),las=1)
X <- rpoisGen(10^5,2)
xs <- seq(0,10)
truehist(X,h=1,col="white",xlab="",xlim=c(0,10), 
         main = "Histogram of generated 
         Pois(2) and line
         Pois(2)", ylim=c(0,0.3), yaxt='n')
lines(xs, dpois(xs,2),col="red",lwd=2)
axis(side=2,at=seq(0,0.3,by=0.01))
abline(h=seq(0,0.3,by=0.01),lty=2,lwd=0.5)

Y <- rgeomGen(10^5,0.2)
xs1 <- seq(0,20)
truehist(Y,h=1,xlim=c(0,20),col="white",xlab="",
         main="Histogram of generated
         geom(0.2) and line 
         geom(0.2)",yaxt='n')
lines(xs1,dgeom(xs1,0.2),col="blue")
axis(side=2,at=seq(0,0.3,by=0.02))
abline(h=seq(0,0.3,by=0.02),lty=2)

all.equal(ppois(2,2),sum(dpois(c(0,1,2),2)))
