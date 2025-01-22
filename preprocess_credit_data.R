# preprocess_credit_data.R
preprocess_credit_data <- function(data) {
  data <- data[complete.cases(data), ] # Remove missing values
  data$IncomeBucket <- cut(data$Income, breaks = 5, labels = FALSE) # Feature engineering
  return(data)
}
