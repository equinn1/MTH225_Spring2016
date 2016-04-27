//model file for week1 parameter estimation exercise
data {
  int N1;                 //sample1 size
  int N2;                 //sample2 size
  real<lower=0> y1[N1];   //sample 1 data
  real<lower=0> y2[N2];   //sample 2 data
}
parameters {
  real<lower=0> theta1;          //parameter for sample 1
  real<lower=0> theta2;          //parameter for sample 2
}
model {
  theta1 ~ normal(0,100);        //half-normal prior for theta1
  theta2 ~ normal(0,100);        //half-normal prior for theta2

  y1 ~ exponential(theta1);      //process data
  y2 ~ exponential(theta2);      
}
generated quantities {
  real diff;
  
  diff<-theta1-theta2;
}
