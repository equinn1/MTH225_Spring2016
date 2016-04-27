//Simple regression model
data {
  int N;               //sample size
  real y[N];           //y data values
  real x[N];           //x data values
}
parameters {
  real beta[2];           //intercept and slope
  real<lower=0> sigma;    //standard error
}
model {
  beta ~ normal(0,100);   //normal priors for intercept and slope
  sigma ~ cauchy(0,10);   //half-cauchy prior for sigma 

  y ~ normal(beta[1]+beta[2]*x,sigma);   //model normal with parameters (mu,sigma)
}
