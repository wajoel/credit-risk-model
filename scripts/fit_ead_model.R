# ead_model.R
fit_ead_model <- function(data) {
  data$Exposure <- ifelse(data$Defaulted == 1, data$LoanAmount * runif(nrow(data), 0.5, 1.0), 0)
  ead_model <- lm(Exposure ~ LoanAmount + Term, data = data)
  return(ead_model)
}
