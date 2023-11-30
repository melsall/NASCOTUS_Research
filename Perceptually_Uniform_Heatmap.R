#PERCEPTUALLY UNIFORM HEATMAPS

# loading libraries
library("ppcor")
library("viridisLite")
library(ggplot2)

# makes a new perceptually uniform scale
get_viridis_scale <- function(n) {
  viridis(n)
}

#making a little liberal datafram
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

results_liberal <- pcor(tiny_liberal, method = c("pearson", "kendall", "spearman"))

# making heatmpa using R heatmap function
heatmap(results_liberal$estimate, 
        Rowv = NA, Colv = NA,  
        xlab = "Variables", ylab = "Variables",
        main = "Liberal Justices Only Heatmap",
        col = get_viridis_scale(100))  # Use viridis color map

# making df, going to use ggplot with this
results_df_liberal <- as.data.frame(results_liberal$estimate)

ggplot(data = results_df_liberal, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradientn(colors = get_viridis_scale(100), na.value = "white") +
  labs(title = "Liberal Justices Only Heatmap",
       x = "Variables", y = "Variables")


#######CONSERVATIVE#########

# this function creates a perceptually uniform color scale
get_viridis_scale <- function(n) {
  viridis(n)
}

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

results_conservative <- pcor(tiny_conservative, method = c("pearson", "kendall", "spearman"))

# using R function
heatmap(results_conservative$estimate, 
        Rowv = NA, Colv = NA,  
        xlab = "Variables", ylab = "Variables",
        main = "Conservative Justices Only Heatmap",
        col = get_viridis_scale(100))  # Use viridis color map

# making heatmap using ggplot2
results_df_conservative <- as.data.frame(results_conservative$estimate)

ggplot(data = results_df_conservative, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradientn(colors = get_viridis_scale(100), na.value = "white") +
  labs(title = "Conservative Justices Only Heatmap",
       x = "Variables", y = "Variables")

