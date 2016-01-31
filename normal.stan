//model file for week1 parameter estimation exercise
data {
  int N;                        //sample size
  real<lower=0> y[N];           //data values
}
parameters {
  real mu;                      //location parameter for normal
  real<lower=0> sigma;             //variance
}
model {
  mu ~ normal(0,100);        //normal prior for mu
  sigma ~ cauchy(0,10);      //half-cauchy prior 
  y ~ normal(mu,sigma);      //process data
}
