# quantify/visualize the how statistically significant the differences in correlation coefficients is across the two matrixes

#  YOU WANT THIS ONE PAL


# making empty matrix where I will store my P VALUES
num_rows <- nrow(conservative_correlations)
num_cols <- ncol(conservative_correlations)
p_vals_mat <- matrix(NA, nrow = num_rows, ncol = num_cols)

# nested loops, element over each element
row_names <- rownames(liberal_data)
col_names <- colnames(conservative_correlations)
for (i in 1:num_rows) {
  for (j in 1:num_cols) {
    # Extract correlation coefficients
    corr_conservative <- as.numeric(conservative_correlations[i, j])
    corr_liberal <- as.numeric(liberal_correlations[i, j])
    
    # Make sure values are numeric
    if (is.na(corr_conservative) || is.na(corr_liberal)) {
      stop("The correlation coefficients are not numeric.")
    }
    
    # fisher's z-transformation 
    z_conservative <- 0.5 * log((1 + corr_conservative) / (1 - corr_conservative))
    z_liberal <- 0.5 * log((1 + corr_liberal) / (1 - corr_liberal))
    
    # making sample size
    liberal_data_no_missing <- na.omit(liberal_data)
    num_rows_without_missing_values <- nrow(liberal_data_no_missing)
    sample_size <- num_rows_without_missing_values
    
    # "standard error of difference"
    se_diff <- sqrt(1 / (sample_size - 3) + 1 / (sample_size - 3))
    
    # tester statistic for the difference
    z_diff <- (z_liberal - z_conservative) / se_diff
    
    # use 2 tailed test to determine statistical significance
    p_value <- 2 * (1 - pnorm(abs(z_diff)))
    
    # FINALLY. Put p-value in the matrix. 
    p_vals_mat[i, j] <- p_value
  }
}




# row + column names
rownames(p_vals_mat) <- c("issueArea", "lawType", "lcDispositionDirection")
colnames(p_vals_mat) <- c("direction", "precedentAlteration", "caseDisposition", "certReason")




# print out that matrix slay
print(p_vals_mat)
