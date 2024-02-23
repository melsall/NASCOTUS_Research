# doing a logistic regression on the entire dataset to tell what features are the most important

# dataset that is just the features that I want

uncleaned_data_for_regression <- composite_dataset[, c('issueArea', 'lawType', 'lcDispositionDirection', 'certReason', 'decisionDirection')]

# Removing rows where 'decisionDirection' column has the value 3
data_for_regression <- subset(uncleaned_data_for_regression, decisionDirection != 3)


# loading some pacakges


# making the 2s into 0s
data_for_regression <- data_for_regression %>%
  mutate(decisionDirection = ifelse(decisionDirection == '2', '0', decisionDirection))

data_for_regression <- na.omit(data_for_regression)
# loading my pacakgaes

# making my dataset correspond to variables

X <- data_for_regression[, -5]  # Features
y <- data_for_regression$decisionDirection
y <- as.factor(data_for_regression$decisionDirection) # making it a factor yas


# Create a logistic regression model
model <- glm(y ~ ., data = as.data.frame(X), family = "binomial")

# using the RFE to select 3 most important columns
ctrl <- rfeControl(functions=rfFuncs, method="cv", number=3)
result <- rfe(as.data.frame(X), as.factor(y), sizes=c(1:13), rfeControl=ctrl)

# printing the selected variableszx
print(result$optVariables)