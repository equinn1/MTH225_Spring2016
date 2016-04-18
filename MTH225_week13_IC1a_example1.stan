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
}
transformed parameters{
    vector[N] lp;                  //logit-tansformed probability of survival  
    for ( i in 1:N ) {
      lp[i] <- a_tank[tank[i]]+a_size[tsize[i]];  //logit p for this tank
    }
}
model{

a_tank ~ normal( 0 , 5 );          //logistic parameters rarely exceed 5
a_size ~ normal(0 , 5);            //logistic parameters rarely exceed 5
surv ~ binomial_logit( tcount , lp );  //survival likelihood
}
generated quantities{
vector[N] p;        //generate survival probabilities for each tank

for ( i in 1:N ) {
  p[i] <- inv_logit(a_tank[tank[i]]+a_size[tsize[i]]);
  }
}
