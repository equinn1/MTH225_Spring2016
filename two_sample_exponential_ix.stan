//compare the means of two exponential populations - single data vector with indicator
data {
  int N;                           //sample1 size
  real<lower=0> y[N];              //sample data
  int<lower=1,upper=2> group[N];   //group indicator must be 1 or 2
}
parameters {
  real<lower=0> theta[2];          //parameters for two groups
}
model {
  int j;
  theta ~ normal(0,100);        //half-normal prior for thetas
  for (i in 1:N){
        j<-group[i];
  	y[i] ~ exponential(theta[j]);
}
generated quantities {
  real diff;
  
  diff<-theta[1]-theta[2];
}
