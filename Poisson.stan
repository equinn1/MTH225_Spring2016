//model file for week1 parameter estimation exercise
data {
  int N;                  //sample size
  int<lower=0> y[N];      //data values
}
parameters {
  real<lower=0> lambda;   //single parameter for poisson
}
model {
  lambda ~ normal(0,100); //half-normal prior 
  y ~ poisson(lambda);    //process data
}
