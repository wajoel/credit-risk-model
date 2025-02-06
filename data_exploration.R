# Load necessary libraries
dev.off()
library(showtext)
library(ggplot2)

# Use Times New Roman font
font_add("Times New Roman", regular = "C:/Windows/Fonts/times.ttf")  # Adjust the path as needed for your system
showtext_auto()

# 1. Preprocessing function
preprocess_data <- function(data) {
  # Handle missing values
  data <- na.omit(data)
  
  # Encode categorical variables
  data$Sex <- as.factor(data$Sex)
  data$Job <- as.factor(data$Job)
  data$Housing <- as.factor(data$Housing)
  data$Saving.accounts <- as.factor(data$Saving.accounts)
  data$Checking.account <- as.factor(data$Checking.account)
  data$Purpose <- as.factor(data$Purpose)
  
  return(data)
}

# 2. Plot Credit Amount Distribution
plot_credit_amount <- function(data) {
  hist(data$Credit.amount, 
       main = "Distribution of Credit Amount", 
       xlab = "Credit Amount", 
       col = "skyblue", 
       border = "black", 
       breaks = 20,
       font.main = 1, cex.main = 1.5, 
       family = "Times New Roman") 
  title(main = "Distribution of Credit Amount", cex.main = 1.5, font.main = 1, family = "Times New Roman", col.main = "black")
}

# 3. Plot Age vs. Credit Amount
plot_age_vs_credit <- function(data) {
  plot(data$Age, data$Credit.amount, 
       xlab = "Age", ylab = "Credit Amount", 
       pch = 19, col = "blue", 
       family = "Times New Roman")
  abline(lm(Credit.amount ~ Age, data = data), col = "red", lwd = 2)
  title(main = "Age vs. Credit Amount", cex.main = 1.5, font.main = 1, family = "Times New Roman", col.main = "black")
}

# 4. Plot Credit Amount by Housing
plot_credit_by_housing <- function(data) {
  boxplot(Credit.amount ~ Housing, data = data, 
          main = "",  # Remove title from boxplot itself
          xlab = "Housing", ylab = "Credit Amount", 
          col = c("skyblue", "lightgreen", "lightcoral"), 
          font.main = 1, cex.main = 1.5, 
          family = "Times New Roman")
  
  # Adjust the title positioning to avoid overlap
  mtext("Credit Amount by Housing", side = 3, line = 0.5, cex = 1.5, 
        font = 1, family = "Times New Roman", col = "black")
}

# 5. Plot Correlation Matrix
plot_correlation <- function(data) {
  cor_matrix <- cor(data[, sapply(data, is.numeric)])
  corrplot::corrplot(cor_matrix, method = "circle", title = "Correlation Matrix", 
                     family = "Times New Roman", cex.main = 1.5)
}

# Main Script to Load Data and Call Functions
data <- read.csv("./german_credit_data.csv")  # Replace with your file path

# Preprocess the data
data <- preprocess_data(data)

# Create visualizations
plot_credit_amount(data)
plot_age_vs_credit(data)
plot_credit_by_housing(data)
plot_correlation(data)

