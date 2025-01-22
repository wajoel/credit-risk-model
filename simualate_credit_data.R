# simulate_credit_data.R
simulate_credit_data <- function(n = 1000) {
  set.seed(123)
  data <- data.frame(
    LoanID = 1:n,
    Income = runif(n, 20000, 100000),
    Age = sample(18:70, n, replace = TRUE),
    CreditScore = runif(n, 300, 850),
    LoanAmount = runif(n, 5000, 50000),
    Term = sample(c(12, 24, 36, 60), n, replace = TRUE),
    Defaulted = sample(0:1, n, replace = TRUE, prob = c(0.8, 0.2))
  )
  return(data)
}
