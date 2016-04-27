//single-factor ACNOVA with two levels, one covariate, unequal slopes and unequal standard errors
data {
  int N;                                //sample1 size
  real y[N];                            //y values
  real x[N];                            //x values (covariate)
  int<lower=1,upper=2> level[N];        //level for this observation (integer 1 or 2)
}
parameters {
  real alpha[2];                //Parameters for the two intercepts
  real beta[2];                 //slope parameters for separate regression lines
  real<lower=0> sigma_e[2];        //error standard deviations
}
model {
  int j;
  alpha ~ normal(0,20);         //normal priors for two intercepts
  beta  ~ normal(0,20);         //normal prior for common slope
  sigma ~ cauchy(0,10);         //half-cauchy prior for error standard deviation 
  
  for (i in 1:N){                   //loop through y values
    j<-level[i];
    y[i] ~ normal(alpha[j]+beta[j]*x[i],sigma_e[j]);  //y[j] has normal likelihood with mean alpha[j]+beta*x[i] and std deviation sigma
  }
}
generated quantities {
  real d12a;
  real d12b;
  real d12s;

  
  d12a<-alpha[1]-alpha[2];      //sample difference between two intercepts
  d12b<-beta[1]-beta[2];        //sample difference between two slopes
  d12s<-sigma_e[1]-sigma_e[2];  //sample difference between standard deviations
}
