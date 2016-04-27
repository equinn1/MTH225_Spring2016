//Estimate the parameter of an exponential distribution
data {
  int N;                        //sample size
  real<lower=0> y[N];           //y is nonnegative reals 
}
parameters {
  real<lower=0> theta;          //parameter must be positive
}
model {
  theta ~ normal(0,100);        //half-normal prior 
  y ~ exponential(theta);       //exponential model with parameter theta
}
