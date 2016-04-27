//Compare means of two normal samples - single data vector with indicator
data {
  int N;                          //sample size
  real y[N];                      //sample data
  int<lower=1,upper=2> group[N];  //group - should be 1 or 2
}
parameters {
  real mu[2];                  //location parameters
  real<lower=0> sigma[2];      //standard deviations 
}
model {
  int j;
  mu ~ normal(0,100);       //normal priors for mu
  sigma ~ cauchy(0,50);     //half-cauchy prior for standard deviations 
  
  for(i in 1:N){
	j<-group[i];
        y[i] ~ normal(mu[j],sigma[j])
}
generated quantities {
  real diff;
  
  diff<-mu[1]-mu[2];             //get posterior sample of difference
}
