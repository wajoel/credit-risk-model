# lgd_model.R
fit_lgd_model <- function(data) {
  data$LossAmount <- ifelse(data$Defaulted == 1, data$LoanAmount * runif(nrow(data), 0.2, 0.8), 0)
  lgd_model <- lm(LossAmount ~ LoanAmount + CreditScore + Term, data = data)
  return(lgd_model)
}
