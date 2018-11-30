using Random
using Distributions
rand(Normal(2,1),10)
-quantile(TDist(8),0.05)
-quantile(TDist(26),0.005)
-quantile(Normal(0,1),0.005)
(1-cdf(Normal(0,1),2/sqrt(2.1)))*2

X=rand(Normal(5,2),16)

Y=rand(Normal(3,2),12)

mean(X)

mean(Y)

var(X)
var(Y)

quantile(Gamma(16,3),0.95)

pdf(Poisson(1),0)+pdf(Poisson(1),1)+pdf(Poisson(1),2)+pdf(Poisson(1),3)
