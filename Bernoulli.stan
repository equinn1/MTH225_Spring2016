//Estimate the probability of success in a Bernoulli distribution
data {
  int N;                       //sample size
  int<lower=0,upper=1> y[N];   //y is binary (zeros and ones)
}
parameters {
  real<lower=0,upper=1> theta;  //parameter is between 0 and 1
}
model {
  theta ~ beta(1,1);          //beta(1,1) is a uniform prior 
  y ~ bernoulli(theta);       //Bernoulli likelihood
}
