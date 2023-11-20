# Purpose: creates graph with green/red, no relationjship among outcomes or among predictors
# library yay

library(qgraph)



# separating predictors + outcomes, can change this if I need to to use different columns
predictors <- composite_dataset[, c("caseSource", "petitioner", "respondent")]
outcomes <- composite_dataset[, c("partyWinning", "decisionDirection", "issueArea")]

# calculating correlation matrix and taking out missing vals
cor_matrix <- cor(cbind(predictors, outcomes), use = "pairwise.complete.obs")

# setting correlations that need to be set to 0 to 0 (among self, predictors --> predictors, etc.)
cor_matrix[1:ncol(predictors), 1:ncol(predictors)] <- 0
diag(cor_matrix) <- 0

# using qgraph to make our network yay
qgraph(cor_matrix, layout = "spring", weighted = TRUE, labels = colnames(cor_matrix))