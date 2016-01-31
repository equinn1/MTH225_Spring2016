//model file for week1 parameter estimation exercise
data {
  int N;                        //sample size
  real<lower=0> y[N];           //data values
}
parameters {
  real mu;                      //location parameter for normal
  real<lower=0> sigma;             //variance
}
model {
  mu ~ normal(0,100);        //normal prior for mu
  sigma ~ cauchy(0,10);      //half-cauchy prior 
  y ~ normal(mu,sigma);      //process data
}
generated quantities {
  real yp[20];
  real ym;
  ym<-0.0;
  for(i in 1:20){
    yp[i]<-normal_rng(mu,sigma);
    ym<-ym+yp[i];
  }
  ym<-ym/20;
}
