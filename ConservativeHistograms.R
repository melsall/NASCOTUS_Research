# 
# ;oad libraries
library(ggplot2)
library(dplyr)


# filter exclusidng 
conservative_data_for_regression <- cleaned_composite_dataset %>%
  filter(presAffiliation == 1, lcDispositionDirection != 3)

total_count <- nrow(conservative_data_for_regression)

# data for percents and count s
summary_data <- conservative_data_for_regression %>%
  count(justicesDecision) %>%
  mutate(percent = n / total_count * 100)

# converting to factor and labeling correctly
summary_data$justicesDecision <- factor(summary_data$justicesDecision,
                                        levels = c("0", "1", "2", "3", "4"),  # adjust the levels based on your actual data
                                        labels = c("Let Stay", "Overturned", "dummy", "dummy", "dummy"))

# plotting
plot <- ggplot(summary_data, aes(x = justicesDecision, y = percent, fill = justicesDecision)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(
    breaks = seq(0, 100, by = 10),  # Set breaks at intervals of 10%
    labels = c("0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"),  # Custom y-axis labels
    limits = c(0, 100),  # Set the limits of the y-axis
    expand = c(0, 0.05)  # Add some padding to the top of the plot
  ) +
  labs(x = "Justice's Decision", y = "Percent of Total (Conservatives)", title = "Distribution of Conservative Decisions Overall") +
  theme_minimal()

# print said plot
print(plot)

