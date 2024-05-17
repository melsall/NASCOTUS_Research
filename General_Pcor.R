#Computing Partial Correlation and creating heatmap from results (generally for data, no party specifics)
library("ppcor")

# make a dataframe with only very niche columns called tiny
# tiny <- data.frame(issueArea = composite_dataset$issueArea, lawType = composite_dataset$lawType, lcDispositionDirection = composite_dataset$lcDispositionDirection, direction = composite_dataset$direction, precedentAlteration = composite_dataset$precedentAlteration, caseDisposition = composite_dataset$caseDisposition, certReason = composite_dataset$certReason)

tiny <- data.frame(lcDispositionDirection = data_for_regression$lcDispositionDirection, justicesDecision = data_for_regression$justicesDecision, presAffiliation = data_for_regression$presAffiliation)
# rid urslef of missing data
if (any(is.na(tiny))) {
  tiny <- na.omit(tiny)  # removeeeee
}



encoded_data <- model.matrix(~ lcDispositionDirection + presAffiliation + justicesDecision, data = tiny)

# Compute partial correlations
results <- pcor(encoded_data, method = c("pearson", "kendall", "spearman"))

#heatmapping
# putting partial correlation in "results" 
heatmap(results$estimate, 
        Rowv = NA, Colv = NA,  # Turn off row and column clustering
        xlab = "Variables", ylab = "Variables",
        main = "Partial Correlation Heatmap")

library(ggplot2)

# make the matrix a df so that ggplot can work with it
results_df <- as.data.frame(results$estimate)

# heatmap generation slay
ggplot(data = results_df, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "Partial Correlation Heatmap",
       x = "Variables", y = "Variables")

