//Compare means of two normal samples
data {
  int N1;              //sample1 size
  int N2;              //sample2 size
  real y1[N1];         //sample 1 data
  real y2[N2];         //sample 2 data
}
parameters {
  real mu1;                  //location parameter for sample 1
  real mu2;                  //location parameter for sample 2
  real<lower=0> sigma1;      //standard deviation sample 1
  real<lower=0> sigma2;      //standard deviation sample 2
}
model {
  mu1 ~ normal(0,100);       //normal prior for mu1
  mu2 ~ normal(0,100);       //normal prior for mu2
  sigma1 ~ cauchy(0,50);     //half-cauchy prior for standard deviation 1 
  sigma2 ~ cauchy(0,50);     //half-cauchy prior for standard deviation 2
  
  y1 ~ normal(mu1,sigma1);   //normal likelihood for sample 1
  y2 ~ normal(mu2,sigma2);   //normal likelihood for sample 2
}
generated quantities {
  real diff;
  
  diff<-mu1-mu2;             //get posterior sample of difference
}
