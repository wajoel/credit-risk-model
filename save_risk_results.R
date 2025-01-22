# save_risk_results.R
save_risk_results <- function(risk, file_name) {
  write.csv(risk, file_name, row.names = FALSE)
  message("Risk results saved to ", file_name)
}
