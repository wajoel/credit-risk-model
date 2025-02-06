# predict_risk.R
predict_risk <- function(data, pd_model, lgd_model, ead_model) {
  pd <- predict(pd_model, newdata = data, type = "prob")[, 2]
  lgd <- predict(lgd_model, newdata = data)
  ead <- predict(ead_model, newdata = data)
  risk <- data.frame(
    LoanID = data$LoanID,
    PD = pd,
    LGD = lgd,
    EAD = ead,
    ExpectedLoss = pd * lgd * ead
  )
  return(risk)
}
