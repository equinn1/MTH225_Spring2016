data{
  int<lower=1> N;                        //sample size
  int<lower=2> Nlevels;                  //number of levels for factor
  real y[N];                             //y value
  int<lower=1,upper=Nlevels> level[N];   //level of factor
}
parameters{
  real alpha[Nlevels];               //parameter for level mean
  real<lower=0> sigma;               //parameter for common sd
  real a;                            //hyperparameter for level means
}
model{
  int j;
  a ~ normal(0 , 1);                 //prior for hyperparameter
  alpha ~ normal(a , 5);             //priors for level means
  for(i in 1:N){
    j<-level[i];
    y[i] ~ normal(alpha[j],sigma);
  }
}

