data{
int<lower=1> N;                    //sample size
int tcount[N];                     //number in this tank initially
int surv[N];                       //number surviving
int tank[N];                       //tank number
int <lower=1, upper=2> tsize[N];   //tank size 1=small 2=large
}
parameters{
vector[N] a_tank;                  //survival parameter for this tank
vector[2] a_size;                  //survival parameters for tank sizes 
real a;                            //hyperparameter for tank mean
real<lower=0> sigma;               //hyperparameter for tank mean sd
}
transformed parameters{
    vector[N] lp;                  //logit-tansformed probability of survival  
    for ( i in 1:N ) {
      lp[i] <- a_tank[tank[i]]+a_size[tsize[i]];  //logit p for this tank
    }
}
model{
a ~ normal(0 , 1);                 //tank mean hyperparameter
sigma ~ cauchy(0,1);               //sd of tank mean hyperparameter
a_tank ~ normal( a , sigma );      //logistic parameters for tank
a_size ~ normal(0 , 5);            //logistic parameters for tank size
surv ~ binomial_logit( tcount , lp );  //survival likelihood
}
generated quantities{
vector[N] p;        //generate survival probabilities for each tank

for ( i in 1:N ) {
  p[i] <- inv_logit(a_tank[tank[i]]+a_size[tsize[i]]);
  }
}
