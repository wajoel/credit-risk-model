# evaluate_model.R
evaluate_model <- function(actual, predicted) {
  library(Metrics)
  auc <- Metrics::auc(actual, predicted)
  gini <- 2 * auc - 1
  return(list(AUC = auc, Gini = gini))
}
