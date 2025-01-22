# visualize_risk.R
visualize_risk <- function(risk) {
  library(ggplot2)
  ggplot(risk, aes(x = ExpectedLoss)) +
    geom_histogram(bins = 30, fill = "blue", alpha = 0.7) +
    labs(title = "Expected Loss Distribution", x = "Expected Loss", y = "Count") +
    theme_minimal()
}
