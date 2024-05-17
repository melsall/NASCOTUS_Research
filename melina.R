# Same thing as conservativePredictorIsolation.R but it's with liberals
library(caret)

# CONSERVATIVE FIRST.

# dataset that is just the features that I want
liberal_data_for_regression <- cleaned_composite_dataset[cleaned_composite_dataset$presAffiliation == 0, ]
liberal_data_for_regression <- liberal_data_for_regression[liberal_data_for_regression$lcDispositionDirection!= 3, ]
liberal_data_for_regression<- liberal_data_for_regression[, c('lawType', 'issueArea', 'lcDispositionDirection', 'certReason', 'justicesDecision')]

# Stop code that is not working.

# take care of missing values
liberal_data_for_regression <- na.omit(liberal_data_for_regression)


# making dataset correspond to variables
#X <- [, -6]
#y <- as.factor(liberal_data_for_regression$justicesDecision) # making it a factor
# Creating logistic regression model

cleaned_composite_dataset$issueArea <- as.factor((cleaned_composite_dataset$lawType))
liberal_data_for_regression$issueArea <- as.factor((liberal_data_for_regression$issueArea))
liberal_data_for_regression$lcDispositionDirection <- as.factor((liberal_data_for_regression$lcDispositionDirection))
cleaned_composite_dataset$justicesDecision <- as.factor((cleaned_composite_dataset$justicesDecision))
#liberal_data_for_regression$presAffiliation <- as.factor((liberal_data_for_regression$presAffiliation))

# THIS IS THE LINE YOU COULD ALTER
model <- glm(justicesDecision ~ issueArea, data = cleaned_composite_dataset, family = binomial(link = "logit"))
print(summary(model))