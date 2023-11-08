#script to make my ordinal values numeric

#loading in
ordinal_data <- read.csv("composite_dataset.csv", header = TRUE)

#making mapping
ordinal_to_numeric_mapping <- c("1" = 5, "2" = 7, "3" = 8)
#making into numerical data
ordinal_data$lcDispositionDirection <- factor(ordinal_data$lcDispositionDirection, levels = names(ordinal_to_numeric_mapping))
ordinal_data$lcDispositionDirection <- as.numeric(ordinal_data$lcDispositionDirection)

# updating composite dataset
write.csv(ordinal_data, "composite_dataset.csv", row.names = FALSE)


# Read the CSV file into a data frame
data_hold<- read.csv("composite_dataset.csv", header = TRUE)

# save ordinal column
ordinal_column <- data_hold$lcDispositionDirection

# Convert the ordinal column to numeric
data_hold$lcDispositionDirection <- as.numeric(ordinal_column)

# Save the updated data frame back to the CSV file, overwriting the original file
write.csv(data, "composite_dataset.csv", row.names = FALSE)
