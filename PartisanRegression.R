# Doing this same thing for conservative/liberals
# doing a logistic regression on the entire dataset to tell what features are the most important

# dataset that is just the features that I want
library(dplyr)
uncleaned_data_for_regression <- liberal_data[, c('issueArea', 'lawType', 'lcDispositionDirection', 'certReason', 'decisionDirection')]

# removing where direction is unspecifiable
data_for_regression <- subset(uncleaned_data_for_regression, decisionDirection != 3)

# making the 2s into 0s so it works with algorithm
data_for_regression <- data_for_regression %>%
  mutate(decisionDirection = ifelse(decisionDirection == '2', '0', decisionDirection))

#take care of missing values
data_for_regression <- na.omit(data_for_regression)


#making dataset correspond to variables
X <- data_for_regression[, -5]
y <- data_for_regression$decisionDirection
y <- as.factor(data_for_regression$decisionDirection) # making it a factor yas


# Creating logistic regression model
model <- glm(y ~ ., data = as.data.frame(X), family = "binomial")

# using the RFE
ctrl <- rfeControl(functions=rfFuncs, method="cv", number=2)
result <- rfe(as.data.frame(X), as.factor(y), sizes=c(1:ncol(X)), rfeControl=ctrl)


# printing the selected variables yay
print("Liberal Results ")
print(result)

# Now doing exact same thing as above for conservative presidents
uncleaned_data_for_regression <- conservative_data[, c('issueArea', 'lawType', 'lcDispositionDirection', 'certReason', 'decisionDirection')]

# removing where direction is unspecifiable
data_for_regression <- subset(uncleaned_data_for_regression, decisionDirection != 3)

# making the 2s into 0s so it works with algorithm
data_for_regression <- data_for_regression %>%
  mutate(decisionDirection = ifelse(decisionDirection == '2', '0', decisionDirection))

#take care of missing values
data_for_regression <- na.omit(data_for_regression)


#making dataset correspond to variables
X <- data_for_regression[, -5]
y <- data_for_regression$decisionDirection
y <- as.factor(data_for_regression$decisionDirection) # making it a factor yas


# Creating logistic regression model
model <- glm(y ~ ., data = as.data.frame(X), family = "binomial")

# using the RFE
ctrl <- rfeControl(functions=rfFuncs, method="cv", number=2)
result <- rfe(as.data.frame(X), as.factor(y), sizes=c(1:ncol(X)), rfeControl=ctrl)


# printing the selected variables yay
print("Conservative Results ")
print(summary(model))
