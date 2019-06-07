library(rjags)
library(coda)


data=read.delim(file = 'multiplelinreg.txt',header = F)
y = data[,1];
x1 = data[,2]; x2=data[,3];
n = dim(data)[1];

inits=function(){list(mu1=rnorm(1,0,1),mu2=rnorm(1,0,1),tau1=1,tau2=1)}
rw.data=list("y","x1","x2","n")
parameters=c("bo","b1","b2","sig")

bayes.rst1=jags(rw.data,inits,model.file="multiplelinreg.bug",parameters=parameters,n.chains=3,n.iter=10000, n.burnin=5000,n.thin=5)
print(bayes.rst1,digits.summary=4)



library(R2jags)
library(rjags)
library(coda)

x=15;
n=20;
inits=function(){list(theta=runif(1,0,1))}
rw.data=list("x","n")
parameters=c("theta")

bayes.rst1=jags(rw.data,inits,model.file="drug_resp.bug",parameters=parameters,n.chains=3,n.iter=10000,
                n.burnin=5000,n.thin=5)
print(bayes.rst1,digits.summary=4)


x1=c(1.7929343, 3.2774292, 4.0844412, 0.6543023, 3.4291247, 3.5060559, 2.4252600,
     2.4533681, 2.4355480, 2.1099622, 2.5228073, 2.0016136, 2.2237461, 3.0644588,
     3.9594941, 2.8897145, 2.4889905, 2.0888046, 2.1628283, 5.4158352)
x2=c(6.201132, 5.263971, 5.339178, 6.689384, 4.959420, 3.827693, 6.862134, 4.464516, 5.977293,
     4.596077, 7.653446, 5.286610, 4.935840, 5.248113, 3.556360, 4.248571, 2.729941, 3.988510,
     5.558559, 5.301154)

inits=function(){list(mu1=rnorm(1,0,1),mu2=rnorm(1,0,1),tau1=1,tau2=1)}
rw.data=list("x1","x2","n")
parameters=c("mu1","sigma1","mu2","sigma2","diff")

bayes.rst1=jags(rw.data,inits,model.file="twosample_normal.bug",parameters=parameters,n.chains=3,n.it
                er=10000, n.burnin=5000,n.thin=5)
print(bayes.rst1,digits.summary=4)




x1=12;
n1=20;
x2=15;
n2=20;
inits=function(){list(p1=runif(1,0,1),p2=runif(1,0,1))}
rw.data=list("x1","n1","x2","n2")
parameters=c("p1","p2","delta")

bayes.rst1=jags(rw.data,inits,model.file="twosamplebinom.bug",parameters=parameters,n.chains=3,n.iter=10000,
                n.burnin=5000,n.thin=5)
print(bayes.rst1,digits.summary=4)
