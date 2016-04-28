data{
  int<lower=1> N;                    //sample size
  int count[N];                      //number of trials
  int success[N];                    //number of successes
  real x[N];                         //continuous predictor
}
parameters{
  real beta0;                        //logistic regression intercept
  real beta1;                        //logistic regression slope 
  real<lower=0> sigma;               //parameter for tank mean sd
}
transformed parameters{
  real lp[N];                  //logit-tansformed probability of success  
  for ( i in 1:N ) {
    lp[i] <- beta0+beta1*x[i];   //logit p
  }
}
model{
  beta0 ~ normal(0 , 5);           //logistic parameters for intercept
  beta1 ~ normal(0 , 5);           //logistic parameters for slope
  sigma ~ cauchy(0,10);            //half-cauchy prior for sigma
  success ~ binomial_logit( count , lp );  //success likelihood
}
