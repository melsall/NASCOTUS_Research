#script to make my ordinal values numeric

#loading in
ordinal_data <- read.csv("composite_dataset.csv", header = TRUE)

#making mapping
ordinal_to_numeric_mapping <- c("1" = 1, "2" = 2, "3" = 3)
#making into numerical data
ordinal_data$lcDispositionDirection <- factor(ordinal_data$lcDispositionDirection, levels = names(ordinal_to_numeric_mapping))
ordinal_data$lcDispositionDirection <- as.numeric(ordinal_data$lcDispositionDirection)

# updating composite dataset
write.csv(ordinal_data, "composite_dataset.csv", row.names = FALSE)
