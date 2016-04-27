//two factor ANOVA with two levels of each factor with interaction - common error standard deviation (cell mean model)
data {
  int N;                                //sample1 size
  real y[N];                            //y values
  int<lower=1,upper=2> level1[N];       //level of factor 1 (integer 1 or 2)
  int<lower=1,upper=2> level2[N];       //level of factor 2 (integer 1 or 2)
}
parameters {
  real alpha[4];                //Parameters for each of the four possible combinations of levels 1 and 2
  real<lower=0> sigma_e;        //common error standard deviation
}
model {
  int j;
  alpha ~ normal(0,20);         //normal priors for each alpha
  sigma ~ cauchy(0,10);         //half-cauchy prior for error standard deviation 
  
  for (i in 1:N){                   //loop through y values
    j<-2*(level1[i]-1)+level2[i];   //compute the cell number
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
  
  d12<-alpha[1]-alpha[2];    //posterior draw difference between alpha1 and alpha2
  d13<-alpha[1]-alpha[3];    //posterior draw difference between alpha1 and alpha3
  d14<-alpha[1]-alpha[4];    //posterior draw difference between alpha1 and alpha4
  d23<-alpha[2]-alpha[3];    //posterior draw difference between alpha2 and alpha3
  d24<-alpha[2]-alpha[4];    //posterior draw difference between alpha2 and alpha4
  d34<-alpha[3]-alpha[4];    //posterior draw difference between alpha3 and alpha4
}
