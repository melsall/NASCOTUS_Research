#Computing Partial Correlation and creating heatmap from results (FOR PARTIES INDIVIDUALLY)

#CONSERVATIVE
library("ppcor")

# make a dataframe with only very niche columns called tiny
tiny <- data.frame(issueArea = conservative_data$issueArea, lawType = conservative_data$lawType, lcDispositionDirection = conservative_data$lcDispositionDirection, direction = conservative_data$direction, precedentAlteration = conservative_data$precedentAlteration, caseDisposition = conservative_data$caseDisposition, certReason = conservative_data$certReason)

# rid urslef of missing data
if (any(is.na(tiny))) {
  tiny <- na.omit(tiny)  # removeeeee
}
# make a matrix called results that has these values
results_con <- pcor(tiny, method = c("pearson", "kendall", "spearman"))


#heatmapping
# putting partial correlation in "results" 
heatmap(results_con$estimate, 
        Rowv = NA, Colv = NA,  # Turn off row and column clustering
        xlab = "Variables", ylab = "Variables",
        main = "Conservative Justices Only Heatmap")

library(ggplot2)

# make the matrix a df so that ggplot can work with it
results_df_con <- as.data.frame(results_con$estimate)

# heatmap generation slay
ggplot(data = results_df_con, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "Conservative Justices Only Heatmap",
       x = "Variables", y = "Variables")

#LIBERALLLLLLL

#Computing Partial Correlation and creating heatmap from results (generally for data, no party specifics)
library("ppcor")

# make a dataframe with only very niche columns called tiny
tiny <- data.frame(issueArea = liberal_data$issueArea, lawType = liberal_data$lawType, lcDispositionDirection = liberal_data$lcDispositionDirection, direction = liberal_data$direction, precedentAlteration = liberal_data$precedentAlteration, caseDisposition = liberal_data$caseDisposition, certReason = liberal_data$certReason)

# rid urslef of missing data
if (any(is.na(tiny))) {
  tiny <- na.omit(tiny)  # removeeeee
}
# make a matrix called results that has these values
results_lib <- pcor(tiny, method = c("pearson", "kendall", "spearman"))

#heatmapping
# putting partial correlation in "results" 
heatmap(results_lib$estimate, 
        Rowv = NA, Colv = NA,  
        xlab = "Variables", ylab = "Variables",
        main = "Liberal Heatmap")

library(ggplot2)

# make the matrix a df so that ggplot can work with it
results_df_lib <- as.data.frame(results_lib$estimate)

# heatmap generation slay
ggplot(data = results_df_lib, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "Liberal Heatmap",
       x = "Variables", y = "Variables")

value = results_df_con[1,4]
print(value)