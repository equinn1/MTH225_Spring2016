//Estimate the parameter of a Poisson distibution
data {
  int N;                  //sample size
  int<lower=0> y[N];      //y values
}
parameters {
  real<lower=0> lambda;   //parameter is positive
}
model {
  lambda ~ normal(0,100); //half-normal prior 
  y ~ poisson(lambda);    //Poissonn likelihood 
}
