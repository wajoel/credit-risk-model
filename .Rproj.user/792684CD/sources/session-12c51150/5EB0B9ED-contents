# Scale numeric variables (e.g., Age, Credit Amount)
scale_data <- function(data) {
  numeric_vars <- c("Age", "Credit.amount", "Duration")  # Add other numeric columns as needed
  data[numeric_vars] <- scale(data[numeric_vars])
  return(data)
}

# Split data into training and test sets
set.seed(42)
train_index <- sample(1:nrow(data), size = 0.7 * nrow(data))  # 70% training, 30% test
train_data <- data[train_index, ]
test_data <- data[-train_index, ]
