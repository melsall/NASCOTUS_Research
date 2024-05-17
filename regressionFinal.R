# FINAL 




# Same thing as conservativePredictorIsolation.R but it's with liberals
library(caret)


# dataset that is just the features that I want

subreg <- cleaned_composite_dataset[, c('lawType', 'issueArea', 'lcDispositionDirection', 'certReason', 'justicesDecision')]
print(table(subreg$issueArea))
# Stop code that is not working.

# take care of missing values
#liberal_data_for_regression <- na.omit(liberal_data_for_regression)


# making dataset correspond to variables
#X <- liberal_data_for_regression[, -6]
#y <- as.factor(liberal_data_for_regression$justicesDecision) # making it a factor
# Creating logistic regression model

subreg$lawType <- as.factor((subreg$lawType))
subreg$issueArea <- as.factor((subreg$issueArea))
subreg$lcDispositionDirection <- as.factor((subreg$lcDispositionDirection))
subreg$certReason <- as.factor((subreg$certReason))
#subreg$presAffiliation <- as.factor((subreg$presAffiliation))

# THIS IS THE LINE YOU COULD ALTER
model <- glm(justicesDecision ~ lcDispositionDirection + issueArea + lawType + lcDispositionDirection + presAffiliation + certReason, data = subreg, family = binomial(link = "logit"))
print(summary(model))