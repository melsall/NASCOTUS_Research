# histograms
# load libraries

library(ggplot2)
library(dplyr)


liberal_data_for_regression <- cleaned_composite_dataset[cleaned_composite_dataset$presAffiliation == 0, ]
liberal_data_for_regression$issueArea <- NULL
# summarize data for counts/percents
summary_data <- liberal_data_for_regression %>%
  count(justicesDecision) %>%
  mutate(percent = n / sum(n) * 100)

#plot
plot <- ggplot(summary_data, aes(x = justicesDecision, y = percent, fill = justicesDecision)) +
  geom_bar(stat = "identity") +
  labs(x = "Justice's Decision", y = "Percent of Total (Liberals)", title = "Percent of Total, no issueArea") +
  theme_minimal()

print(plot)


