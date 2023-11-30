# GENERATING PARTISAN CORRELATION MATRICES

# For liberal justices

# making subsets of predictor and outcome variables
predictor_vars <- liberal_data[, c("issueArea", "lawType", "lcDispositionDirection")]
outcome_vars <- liberal_data[, c("direction", "precedentAlteration", "caseDisposition", "certReason")]


# initializing a matrix to store correlations & using NA to deal with those missign vals
liberal_cor_matrix <- matrix(NA, nrow = ncol(predictor_vars), ncol = ncol(outcome_vars))

# ensure that names are retained
rownames(liberal_cor_matrix) <- colnames(predictor_vars)
colnames(liberal_cor_matrix) <- colnames(outcome_vars)
# loop through sequences of predictors + outcomes
for (i in seq_along(predictor_vars)) {
  for (j in seq_along(outcome_vars)) {
    # calculate the correlation for the current pair and use = complete.obs
    liberal_cor_matrix[i, j] <- cor(predictor_vars[, i], outcome_vars[, j], use = "complete.obs")
  }
}

# Make a conservative cor matrix


# GENERATING PARTISAN CORRELATION MATRICES

# For liberal justices
# For conservative justices

# making subsets of predictor and outcome variables
predictor_vars <- conservative_data[, c("issueArea", "lawType", "lcDispositionDirection")]
outcome_vars <- conservative_data[, c("direction", "precedentAlteration", "caseDisposition", "certReason")]


# initializing a matrix to store correlations & using NA to deal with those missign vals
conservative_cor_matrix <- matrix(NA, nrow = ncol(predictor_vars), ncol = ncol(outcome_vars))

# ensure that names are retained
rownames(conservative_cor_matrix) <- colnames(predictor_vars)
colnames(conservative_cor_matrix) <- colnames(outcome_vars)
# loop through sequences of predictors + outcomes
for (i in seq_along(predictor_vars)) {
  for (j in seq_along(outcome_vars)) {
    # calculate the correlation for the current pair and use = complete.obs
    conservative_cor_matrix[i, j] <- cor(predictor_vars[, i], outcome_vars[, j], use = "complete.obs")
  }
}


### Compare these matrix johns

# create the two matrixes and create a new one
compare_matrices <- function(liberal_cor_matrix, conservative_cor_matrix) {
  result_matrix <- ifelse(liberal_cor_matrix > conservative_cor_matrix, 1, ifelse(conservative_cor_matrix > liberal_cor_matrix, 2, 0))
  return(result_matrix)
}

# Call the function with your matrices
result <- compare_matrices(liberal_cor_matrix, conservative_cor_matrix)

# Print the result
print(result)

