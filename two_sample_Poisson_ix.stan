//Compare the means of two Poisson samples - group designated by indicator variable
data {
  int<lower=1> N1;                 //sample size need at least 1
  int<lower=0> y[N];               //sample data (both groups)
  int<lower=1,upper=2> group[N];   //group indicator - must be 1 or 2
}
parameters {
  real<lower=0> lambda[2];    //parameters for each group
}
model {
  int j;
  lambda ~ normal(10,100);  //normal prior for both lambdas

  for(i in 1:N){
	j<-group[i];                    //j is group number   
        y[i] ~ poisson(lambda1[j]);     //Poisson model with parameter lambda[j]   
}
generated quantities {
  real diff;
  
  diff<-lambda[1]-lambda[2];
}
