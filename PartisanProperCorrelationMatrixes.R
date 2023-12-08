# Creating 2 matrixes, one is liberal, one is conservative. Make correlation matrixes with correct amount of rows and columns


#### CREATING LIBERAL MATRIX ######

lib_subset_rows <- liberal_data[, c("issueArea", "lawType", "lcDispositionDirection")]
lib_subset_columns <- liberal_data[, c("direction", "precedentAlteration", "caseDisposition", "certReason")]

print(liberal_data)
# handle NA vals, calculate correlation matrix
liberal_correlations<- cor(lib_subset_rows, lib_subset_columns, use = "complete.obs")

#print result
print("Liberal Correlation Matrix")
print(liberal_correlations)

#### CREATING CONSERVATIVE MATRIX ######
cons_subset_rows <- conservative_data[, c("issueArea", "lawType", "lcDispositionDirection")]
cons_subset_columns <- conservative_data[, c("direction", "precedentAlteration", "caseDisposition", "certReason")]

# handle NA vals, calculate correlation matrix
conservative_correlations<- cor(cons_subset_rows, cons_subset_columns, use = "complete.obs")

#print result
print("Conservative Correlation Matrix")
print(conservative_correlations)