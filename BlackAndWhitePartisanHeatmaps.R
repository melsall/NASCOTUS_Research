# improved perceptually uniform 

######LIBERAL

#PERCEPTUALLY UNIFORM HEATMAPS

# loading libraries
library("ppcor")
library("viridisLite")
library(ggplot2)
library(reshape2)
# makes a new perceptually uniform scale
get_viridis_scale <- function(n) {
  viridis(n)
}

#making a little liberal dataframe
tiny_liberal <- data.frame(issueArea = liberal_data$issueArea, 
                           lawType = liberal_data$lawType, 
                           lcDispositionDirection = liberal_data$lcDispositionDirection, 
                           direction = liberal_data$direction, 
                           precedentAlteration = liberal_data$precedentAlteration, 
                           caseDisposition = liberal_data$caseDisposition, 
                           certReason = liberal_data$certReason)

if (any(is.na(tiny_liberal))) {
  tiny_liberal <- na.omit(tiny_liberal)
}

#generating correlation map
results_liberal <- pcor(tiny_liberal, method = c("pearson", "kendall", "spearman"))


# reordering rows and columns
predictors <- c("issueArea", "lawType", "lcDispositionDirection") #predictors
outcomes <- c("direction", "precedentAlteration", "caseDisposition", "certReason") # outcomes

# get that correlation matrix girl
lib_cor_matrix <- results_liberal$estimate

# reordering rows and columns
lib_ordered_matrix <- lib_cor_matrix[predictors, outcomes]

# generation of heatmap

# Generation of black and white heatmap
heatmap(
  lib_ordered_matrix,
  Rowv = NA, Colv = NA,
  xlab = "Outcomes", ylab = "Predictors",
  main = "Liberal Justices Only Heatmap",
  col = gray.colors(100, start = 0, end = 1)
)



# make map using ggplot
# Make map using ggplot
ggplot(data = melt(lib_ordered_matrix), aes(x = Var2, y = Var1, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "black", na.value = "white") +
  labs(title = "Liberal Justices Only Heatmap",
       x = "Outcomes", y = "Predictors")



######## Conservative ########



#making a little liberal dataframe
tiny_conservative <- data.frame(issueArea = conservative_data$issueArea, 
                           lawType = conservative_data$lawType, 
                           lcDispositionDirection = conservative_data$lcDispositionDirection, 
                           direction = conservative_data$direction, 
                           precedentAlteration = conservative_data$precedentAlteration, 
                           caseDisposition = conservative_data$caseDisposition, 
                           certReason = conservative_data$certReason)

if (any(is.na(tiny_conservative))) {
  tiny_conservative <- na.omit(tiny_conservative)
}

#generating correlation map
results_conservative<- pcor(tiny_conservative, method = c("pearson", "kendall", "spearman"))


# reordering rows and columns
predictors <- c("issueArea", "lawType", "lcDispositionDirection") # predictors
outcomes <- c("direction", "precedentAlteration", "caseDisposition", "certReason") # outcomes

# get that correlation matrix girl
cons_cor_matrix <- results_conservative$estimate

# reordering rows and columns
cons_ordered_matrix <- cons_cor_matrix[predictors, outcomes]


# Generation of black and white heatmap
heatmap(
  cons_ordered_matrix,
  Rowv = NA, Colv = NA,
  xlab = "Outcomes", ylab = "Predictors",
  main = "Conservative Justices Only Heatmap",
  col = gray.colors(100, start = 0, end = 1)
)



# make map using ggplot
# Make map using ggplot
ggplot(data = melt(lib_ordered_matrix), aes(x = Var2, y = Var1, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "black", na.value = "white") +
  labs(title = "Conservative Justices Only Heatmap",
       x = "Outcomes", y = "Predictors")


print(lib_cor_matrix)
print(cons_cor_matrix)