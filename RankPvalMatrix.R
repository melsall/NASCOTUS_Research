# RankPvals

# get those indices of sorted values
sorted_indices <- order(p_vals_mat)

# printing values in order + including what their row and column names are
cat("\nValues in Order (Least --> Greatest)\n")
for (i in sorted_indices) {
  row_index <- floor((i - 1) / ncol(p_vals_mat)) + 1
  col_index <- (i - 1) %% ncol(p_vals_mat) + 1
  cat("Row:", rownames(p_vals_mat)[row_index], ", Column:", colnames(p_vals_mat)[col_index], ", Value:", p_vals_mat[row_index, col_index], "\n")
}
