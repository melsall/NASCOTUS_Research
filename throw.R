# thrower

# Whole dataset (not divided on conservative/liberal data)
# doing a logistic regression on the entire dataset to tell what features are the most important

# dataset that is just the features that I want
uncleaned_data_for_regression <- composite_dataset[, c('caseId', 'issueArea', 'lawType', 'lcDispositionDirection', 'certReason', 'presAffiliation')]

uncleaned_data_for_regression <- head(uncleaned_data_for_regression, 80000)

# removing where direction is unspecifiable


print(length(case_subset_data))
print(length(uncleaned_data_for_regression))
# IDK if this is working. 

data_for_regression <- merge(uncleaned_data_for_regression, case_subset_data, by = "caseId", all = TRUE)

# Stop code that is not working.
# making the 2s into 0s so it works with algorithm

# take care of missing values
data_for_regression <- na.omit(data_for_regression)

# making dataset correspond to variables
X <- data_for_regression[, -6]
y <- as.factor(data_for_regression$caseDisposition) # making it a factor

# Creating logistic regression model
data_for_regression$caseDisposition <- as.factor((data_for_regression$caseDisposition))
data_for_regression$lawType <- as.factor((data_for_regression$lawType))
data_for_regression$issueArea <- as.factor((data_for_regression$issueArea))
data_for_regression$lcDispositionDirection <- as.factor((data_for_regression$lcDispositionDirection))
data_for_regression$certReason <- as.factor((data_for_regression$certReason))
data_for_regression$presAffiliation <- as.factor((data_for_regression$presAffiliation))
model <- glm(caseDisposition ~ ., data = data_for_regression, family = binomial(link = "logit"))
print("HI")
print(summary(model))
# using the RFE
#ctrl <- rfeControl(functions=rfFuncs, method="cv", number=2)
#result <- rfe(data_for_regression[, -6], as.factor(y), sizes=c(1:ncol(X)), rfeControl=ctrl)

# printing the selected variables yay
#print(result)





