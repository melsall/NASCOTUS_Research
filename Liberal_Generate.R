# Create a liberal dataset, see what the relationships are between set predictors and outcomes
#load in library:
library(qgraph)

#creating a new dataset with only the justices that were chosen by LIBERAL presidents
liberal_data <- composite_dataset[composite_dataset$presAffiliation == 0, ]



# separating predictors + outcomes, can change this if I need to to use different columns
predictors <- liberal_data[, c("issueArea", "lawType", "lcDispositionDirection")]
outcomes <- liberal_data[, c("direction", "precedentAlteration", "caseDisposition", "certReason")]

# calculating correlation matrix and taking out missing vals
cor_matrix <- cor(cbind(predictors, outcomes), use = "pairwise.complete.obs")

# setting correlations that need to be set to 0 to 0 (among self, predictors --> predictors, etc.)
cor_matrix[1:ncol(predictors), 1:ncol(predictors)] <- 0
cor_matrix[1:ncol(outcomes), 1:ncol(outcomes)] <- 0
diag(cor_matrix) <- 0

# using qgraph to make our network yay
qgraph(cor_matrix, layout = "spring", weighted = TRUE, labels = colnames(cor_matrix), title = "Liberal Justices Correlations")
