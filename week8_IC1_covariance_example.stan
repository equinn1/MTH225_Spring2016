//model file for week8: Single factor ANOVA with a covariate
data {
  int N;                  //sample1 size
  int cityhighway[N];     //city or highway
  real weight[N];         //number of levels
  real mpg[N];            //y values - nanoseconds
}
parameters {
  real city;               //car 
  real highway;             //truck
  real beta;              //beta is the slope of the parallel regression lines
  real<lower=0> sigma;             //residual standard error
}
model {
  city ~ normal(0,5);        //normal priors for slope includes all reasonable mileage values
  highway ~ normal(0,5);      //slope will be very small with small standard deviation if weight is in pounds
  beta ~ normal(0,5);      //slope will be very small with small standard deviation if weight is in pounds
  sigma ~ cauchy(0,5);       //half-Cauchy prior for residual standard error
  
  for (i in 1:N)                   //loop through y values
    if (cityhighway[i]==1)  
      mpg[i] ~ normal(50.0+highway+beta*weight[i],sigma);
    else 
      mpg[i] ~ normal(50.0+city+beta*weight[i],sigma);
}