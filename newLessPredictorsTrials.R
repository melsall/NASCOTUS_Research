# Using original less predictors. Don't think I need this whole case-centered data thing anymore. 
library(caret)

# Whole dataset (not divided on conservative/liberal data)
# doing a logistic regression on the entire dataset to tell what features are the most important

# dataset that is just the features that I want
uncleaned_data_for_regression <- cleaned_composite_dataset[, c('lawType', 'lcDispositionDirection', 'certReason', 'presAffiliation', 'justicesDecision')]

# Stop code that is not working.

# take care of missing values
data_for_regression <- na.omit(uncleaned_data_for_regression)


# making dataset correspond to variables
X <- data_for_regression[, -6]
y <- as.factor(data_for_regression$justicesDecision) # making it a factor
# Creating logistic regression model

data_for_regression$lawType <- as.factor((data_for_regression$lawType))
#data_for_regression$issueArea <- as.factor((data_for_regression$issueArea))
data_for_regression$lcDispositionDirection <- as.factor((data_for_regression$lcDispositionDirection))
data_for_regression$certReason <- as.factor((data_for_regression$certReason))
#data_for_regression$presAffiliation <- as.factor((data_for_regression$presAffiliation))

# THIS IS THE LINE YOU COULD ALTER
model <- glm(justicesDecision ~ presAffiliation - justicesDecision, data = data_for_regression, family = binomial(link = "logit"))
print(summary(model))
# using the RFE
#ctrl <- rfeControl(functions=rfFuncs, method="cv", number=2)
#result <- rfe(data_for_regression[, -4], as.factor(y), sizes=c(1:ncol(X)), rfeControl=ctrl)

# printing the selected variables yay
#print(result)


