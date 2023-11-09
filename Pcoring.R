# Successfully computed the partial correlation, so slay
library("ppcor")

# make a df w/ only 2 columns
tiny <- data.frame(caseSource = composite_dataset$caseSource, petitioner = composite_dataset$petitioner)

# rid urslef of missing data
if (any(is.na(tiny))) {
  tiny <- na.omit(x)  # removeeeee
}
# yay pcor
results <- pcor(tiny, method = c("pearson", "kendall", "spearman"))
print(results)