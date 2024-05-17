# partisan isolation of predictors. newLessPredictorsTrials.R partisan edition
library(caret)

# CONSERVATIVE FIRST.

# dataset that is just the features that I want (0 is liberal)
conservative_data_for_regression <- cleaned_composite_dataset[cleaned_composite_dataset$presAffiliation == 1, ]



conservative_data_for_regression<- conservative_data_for_regression[, c('lawType', 'lcDispositionDirection', 'certReason', 'justicesDecision')]

# Stop code that is not working.

# take care of missing values
conservative_data_for_regression <- na.omit(conservative_data_for_regression)



# making dataset correspond to variables
X <- conservative_data_for_regression[, -6]
y <- as.factor(conservative_data_for_regression$justicesDecision) # making it a factor
# Creating logistic regression model

conservative_data_for_regression$lawType <- as.factor((conservative_data_for_regression$lawType))
#conservative_data_for_regression$issueArea <- as.factor((conservative_data_for_regression$issueArea))
conservative_data_for_regression$lcDispositionDirection <- as.factor((conservative_data_for_regression$lcDispositionDirection))
conservative_data_for_regression$certReason <- as.factor((conservative_data_for_regression$certReason))
#conservative_data_for_regression$presAffiliation <- as.factor((conservative_data_for_regression$presAffiliation))

# THIS IS THE LINE YOU COULD ALTER
model <- glm(justicesDecision ~ lcDispositionDirection - justicesDecision, data = conservative_data_for_regression, family = binomial(link = "logit"))
print(summary(model))

