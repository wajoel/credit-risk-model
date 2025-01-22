# pd_model.R
fit_pd_model <- function(data) {
  library(caret)
  data$Defaulted <- as.factor(data$Defaulted)
  train_control <- trainControl(method = "cv", number = 5)
  pd_model <- train(Defaulted ~ Income + Age + CreditScore + LoanAmount + Term, 
                    data = data, 
                    method = "glm", 
                    family = "binomial", 
                    trControl = train_control)
  return(pd_model)
}
