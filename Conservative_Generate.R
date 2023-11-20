 
#load in library:
library(qgraph)


# Create a conservative dataset, see what the relationships are between set predictors and outcomes

# separating predictors + outcomes, can change this if I need to to use different columns
predictors <- conservative_data[, c("issueArea", "lawType", "lcDispositionDirection")]
outcomes <- conservative_data[, c("direction", "precedentAlteration", "caseDisposition", "certReason")]

# calculating correlation matrix and taking out missing vals
cor_matrix <- cor(cbind(predictors, outcomes), use = "pairwise.complete.obs")

# setting correlations that need to be set to 0 to 0 (among self, predictors --> predictors, etc.)
cor_matrix[1:ncol(predictors), 1:ncol(predictors)] <- 0
cor_matrix[1:ncol(outcomes), 1:ncol(outcomes)] <- 0
diag(cor_matrix) <- 0

# using qgraph to make our network yay
qgraph(cor_matrix, layout = "spring", weighted = TRUE, labels = colnames(cor_matrix), title = "Conservative Justices Correlations")