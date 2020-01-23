
## parsing command arguments
for (arg in commandArgs(TRUE)) {
  eval(parse(text = arg))
}

## check if a given integer is prime
isPrime <- function(n) {
  if (n <= 3) {
    return(TRUE)
  }
  if (any((n %% 2:floor(sqrt(n))) == 0)) {
    return(FALSE)
  }
  return(TRUE)
}

## estimate mean only using observation with prime indices
estMeanPrimes <- function(x) {
  n <- length(x)
  ind <- sapply(1:n, isPrime)
  return(mean(x[ind]))
}

set.seed(seed)
mean_prime_est <- 0
mean_samp_est <- 0

for (i in 1:rep) {
  ## simulate data
  if (dist == "gaussian") {
    x <- rnorm(n)
  } else if (dist == "t1") {
    x <- rt(n, 1)
  } else if (dist == "t5") {
    x <- rt(n, 5)
  } else {
    stop("Distribution Not Recognized")
  }

  ## mean estimate for both methods
  mean_prime_est[i] <- estMeanPrimes(x)
  mean_samp_est[i] <- mean(x)
}

## MSE formula give that true mean = 0
mse_prime_avg <- sum(mean_prime_est^2) / rep
mse_samp_avg <- sum(mean_samp_est^2) / rep

## print values
mse_prime_avg
mse_samp_avg
