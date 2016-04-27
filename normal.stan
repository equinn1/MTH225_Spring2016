//Estimate the perameters of a normal distribution
data {
  int N;               //sample size
  real y[N];           //y data values
}
parameters {
  real mu;                //location parameter for normal
  real<lower=0> sigma;    //dispersion parameter (standard deviation)
}
model {
  mu ~ normal(0,100);     //normal prior for mu
  sigma ~ cauchy(0,10);   //half-cauchy prior for sigma 
  y ~ normal(mu,sigma);   //model normal with parameters (mu,sigma)
}
generated quantities {    //generate a sample of size 20 using posterior
  real yp[20];            //also compute the sample mean as ym
  real ym;
  ym<-0.0;
  for(i in 1:20){
    yp[i]<-normal_rng(mu,sigma);
    ym<-ym+yp[i];
  }
  ym<-ym/20;
}
