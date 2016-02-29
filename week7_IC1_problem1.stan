//model file for week7: simple regression
data {
  int N;               //sample1 size
  real x[N];           //number of levels
  real y[N];           //y values - nanoseconds
}
parameters {
  real icpt;         //2 Parameters - slope and intercept
  real slope;
  real<lower=0> sigma;             //residual standard error
}
model {
  icpt ~ normal(0,10);     //normal priors for slope and intercept
  slope ~ normal(0,10);         //
  sigma ~ normal(0,5);          //half-Cauchy prior for residual standard error
  
  for (i in 1:N){                   //loop through y values
    y[i] ~ normal(icpt+slope*x[i],sigma); 
  }
}
