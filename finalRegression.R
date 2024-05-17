# Same thing as conservativePredictorIsolation.R but it's with liberals
library(caret)

# dataset that is just the features that I want
subreg <- cleaned_composite_dataset[, c('lawType', 'issueArea', 'lcDispositionDirection', 'certReason', 'justicesDecision', 'presAffiliation')]
print(table(subreg$issueArea))
# Stop code that is not working.



# making dataset correspond to variables
#X <- subreg[, -6]
#y <- as.factor(subreg$justicesDecision) # making it a factor
# Creating logistic regression model

subreg$lawType <- as.factor((subreg$lawType))
subreg$issueArea <- as.factor((subreg$issueArea))
subreg$lcDispositionDirection <- as.factor((subreg$lcDispositionDirection))
subreg$certReason <- as.factor((subreg$certReason))
subreg$presAffiliation <- as.factor((subreg$presAffiliation))

# THIS IS THE LINE YOU COULD ALTER
model <- glm(justicesDecision ~ lcDispositionDirection + issueArea + lawType + presAffiliation, data = subreg, family = binomial(link = "logit"))
print(summary(model))
