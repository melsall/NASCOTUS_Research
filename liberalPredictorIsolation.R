# Same thing as conservativePredictorIsolation.R but it's with liberals
library(caret)

# CONSERVATIVE FIRST.

# dataset that is just the features that I want
liberal_data_for_regression <- cleaned_composite_dataset[cleaned_composite_dataset$presAffiliation == 0, ]

liberal_data_for_regression<- cleaned_composite_dataset[, c('lawType', 'lcDispositionDirection', 'certReason', 'justicesDecision')]

# Stop code that is not working.

# take care of missing values
liberal_data_for_regression <- na.omit(liberal_data_for_regression)


# making dataset correspond to variables
X <- liberal_data_for_regression[, -6]
y <- as.factor(liberal_data_for_regression$justicesDecision) # making it a factor
# Creating logistic regression model

liberal_data_for_regression$lawType <- as.factor((liberal_data_for_regression$lawType))
#liberal_data_for_regression$issueArea <- as.factor((liberal_data_for_regression$issueArea))
liberal_data_for_regression$lcDispositionDirection <- as.factor((liberal_data_for_regression$lcDispositionDirection))
liberal_data_for_regression$certReason <- as.factor((liberal_data_for_regression$certReason))
#liberal_data_for_regression$presAffiliation <- as.factor((liberal_data_for_regression$presAffiliation))

# THIS IS THE LINE YOU COULD ALTER
model <- glm(justicesDecision ~ lcDispositionDirection- justicesDecision, data = liberal_data_for_regression, family = binomial(link = "logit"))
print(summary(model))
