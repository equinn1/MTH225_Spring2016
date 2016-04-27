//Compare the means of two Poisson samples
data {
  int<lower=1> N1;       //sample1 size need at least 1
  int<lower=1> N2;       //sample2 size
  int<lower=0> y1[N1];   //sample 1 data
  int<lower=0> y2[N2];   //sample 2 data
}
parameters {
  real<lower=0> lambda1;    //parameter for sample 1
  real<lower=0> lambda2;    //parameter for sample 2
}
model {
  lambda1 ~ normal(10,100);  //normal prior for lambda1
  lambda2 ~ normal(10,100);  //normal prior for lambda2

  y1 ~ poisson(lambda1);   //Poisson model with parameter lambda1
  y2 ~ poisson(lambda2);   //Poisson model with parameter lambda2   
}
generated quantities {
  real diff;
  
  diff<-lambda1-lambda2;
}
