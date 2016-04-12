data {
  int<lower=0> N;
  int<lower=1> N_lvls_a;
  int<lower=1> N_lvls_b;
  int<lower=1,upper=2> cartruck[N];
  int<lower=1,upper=2> cityhwy[N];
  vector[N] mpg;
} 
parameters {
  vector[2] eta_a;
  vector[2] eta_b;
  real mu;
  real<lower=0> sigma_a;
  real<lower=0> sigma_b;
  real<lower=0> sigma_mpg;
}
transformed parameters {
  vector[N] mpg_hat;
  vector[N_lvls_a] a;
  vector[N_lvls_b] b;

  a <- 20.0 * mu + eta_a * sigma_a;
  b <- 20.0 * mu + eta_b * sigma_b;

  for (i in 1:N)
    mpg_hat[i] <- a[cartruck[i]] + b[cityhwy[i]];
} 
model {
  mu ~ normal(0, 1);
  eta_a ~ normal(0, 1);
  eta_b ~ normal(0, 1);
  sigma_a ~ cauchy(0,20);
  sigma_b ~ cauchy(0,20);
  sigma_mpg ~ cauchy(0,100);
  mpg ~ normal(mpg_hat, sigma_mpg);
}
generated quantities{
  real mpg_car_hwy;
  real mpg_car_city;
  real mpg_truck_hwy;
  real mpg_truck_city;
  mpg_car_hwy<-a[1]+b[2];
  mpg_car_city<-a[2]+b[2];
  mpg_truck_hwy<-a[1]+b[1];
  mpg_truck_city<-a[2]+b[1];
}
