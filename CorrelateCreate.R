# 1. GENERATING CORRELATION MATRIXES YAY
# making subsets of predictor and outcome variables
predictor_vars <- composite_dataset[, c("caseSource", "petitioner", "respondent")]
outcome_vars <- data[, c("partyWinning", "decisionDirection")]

# initializing a matrix to store correlations & using NA to deal with those missign vals
cor_matrix <- matrix(NA, nrow = ncol(predictor_vars), ncol = ncol(outcome_vars))

# loop through sequences of predictors + outcomes
for (i in seq_along(predictor_vars)) {
  for (j in seq_along(outcome_vars)) {
    # calculate the correlation for the current pair and use = complete.obs
    cor_matrix[i, j] <- cor(predictor_vars[, i], outcome_vars[, j], use = "complete.obs")
  }
}

# print to see if it works
print(cor_matrix)
print(class(cor_matrix))