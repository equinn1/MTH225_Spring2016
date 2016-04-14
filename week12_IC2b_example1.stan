//cell mean model for 2-facto ANOVA
data {
  int<lower=0> N;
  int<lower=1> N_lvls_a;
  int<lower=1> N_lvls_b;
  int<lower=1,upper=2> cartruck[N];  //1<-car 2<-truck
  int<lower=1,upper=2> cityhwy[N];   //1<-city 2<-hwy
  vector[N] mpg;
} 
transformed data {
  int cells;
  cells <- N_lvls_a*N_lvls_b;
  print(cells);
}
parameters {
  vector[cells] eta;
  vector<lower=0>[cells] sigma_cell;
  real<lower=0> sigma_e;
}
model {
  int j;
  eta        ~ normal(0,sigma_cell);
  sigma_cell ~ cauchy(0,10);
  sigma_e    ~ cauchy(0,20);
  
  for (i in 1:N){
    j <- 2*(cartruck[i]-1)+cityhwy[i];
                                        // 1<- car,city
                                        // 2<- car,hwy
                                        // 3<- truck,city
                                        // 4<- truck,hwy
    mpg[i] ~ normal(eta[j],sigma_e);
  }
}

