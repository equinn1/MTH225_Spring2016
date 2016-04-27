//Estimate the parameters of a gamma distribution
data {
  int N;                        //sample size
  real<lower=0> y[N];           //y values are positive
}
parameters {
  real<lower=0> alpha;          //shape parameter (positive)
  real<lower=0> beta;           //scale parameter (positive)
}
model {
  alpha ~ normal(0,50);         //half-normal prior for alpha
  beta  ~ normal(0,50);         //half-normal prior for beta 
  y ~ gamma(alpha,beta);        //model as gamma with parameters alpha,beta
}
