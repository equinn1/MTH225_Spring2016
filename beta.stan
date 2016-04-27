//Estimate the parameters of a beta distribution
data {
  int N;                        //sample size
  real<lower=0,upper=1> y[N];   //y takes values between zero and one
}
parameters {
  real<lower=0> alpha;          //shape parameter (positive)
  real<lower=0> beta;           //scale parameter (positive)
}
model {
  alpha ~ normal(0,50);         //half-normal prior for shape
  beta  ~ normal(0,50);         //half-normal prior for scale
  y ~ beta(alpha,beta);         //beta model with parameters alpha,beta
}
