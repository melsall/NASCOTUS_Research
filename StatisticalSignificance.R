# quantify/visualize the how statistically significant the differences in correlation coefficients is across the two matrixes


# matrixes conservative_correlations and liberal_correlations
corr_conservative <- as.numeric(conservative_correlations[1, 2])
corr_liberal <- as.numeric(liberal_correlations[1, 2])

# Check if the extracted values are numeric
if (is.na(corr_conservative) || is.na(corr_liberal)) {
  stop("The correlation coefficients are not numeric.")
}

# Apply Fisher's z-transformation
z_conservative <- 0.5 * log((1 + corr_conservative) / (1 - corr_conservative))
z_liberal <- 0.5 * log((1 + corr_liberal) / (1 - corr_liberal))

# Assume a common sample size for simplicity

liberal_data_no_missing <- na.omit(liberal_data)

# Count the number of rows excluding missing values
num_rows_without_missing_values <- nrow(liberal_data_no_missing)


sample_size <- num_rows_without_missing_values

# Calculate standard error of the difference
se_diff <- sqrt(1 / (sample_size - 3) + 1 / (sample_size - 3))

# Calculate the test statistic for the difference
z_diff <- (z_liberal - z_conservative) / se_diff

# Determine statistical significance using a two-tailed test
p_value <- 2 * (1 - pnorm(abs(z_diff)))
print("P VALUEEEEE")
print(p_value)
# Print the results
cat("Z difference:", z_diff, "\n")
cat("P-value:", p_value, "\n")

# Check if the difference is statistically significant at a 0.05 significance level
if (p_value < 0.05) {
  cat("The difference is statistically significant.\n")
} else {
  cat("The difference is not statistically significant.\n")
}
