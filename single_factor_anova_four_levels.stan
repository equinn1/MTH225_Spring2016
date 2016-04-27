//single-factor ANOVA with four levels and common error standard deviation
data {
  int N;                                //sample1 size
  real y[N];                            //y values
  int<lower=1,upper=4> level[N];        //level for this observation (integer 1,2,3 or 4)
}
parameters {
  real alpha[4];                //Parameters for each level of the single factor
  real<lower=0> sigma_e;        //common error standard deviation for each level
}
model {
  int j;
  alpha ~ normal(0,20);        //normal priors for each alpha level 
  sigma ~ cauchy(0,10);         //half-cauchy prior for error standard deviation - same for all levels 
  
  for (i in 1:N){                   //loop through y values
    j<-level[i];
    y[i] ~ normal(alpha[j],sigma_e);  //y[j] has normal likelihood with mean alpha[j] and std deviation sigma
  }
}
generated quantities {
  real d12;
  real d13;
  real d14;
  real d23;
  real d24;
  real d34;
  
  d12<-alpha[1]-alpha[2];    //sample difference between alpha1 and alpha2
  d13<-alpha[1]-alpha[3];    //sample difference between alpha1 and alpha3
  d14<-alpha[1]-alpha[4];    //sample difference between alpha1 and alpha4
  d23<-alpha[2]-alpha[3];    //sample difference between alpha2 and alpha3
  d24<-alpha[2]-alpha[4];    //sample difference between alpha2 and alpha4
  d34<-alpha[3]-alpha[4];    //sample difference between alpha3 and alpha4
}
