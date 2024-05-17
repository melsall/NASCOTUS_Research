# data for histogram
#creating subset, only the rows where presAffiliation is != 1 (if you want to do liberal), should be != 0 if you want to do conservative
lib_data_for_hist <- na.omit(subset(all_data_copy, presAffiliation != 1, select = c("issueArea", "presAffiliation", "justicesDecision")))



# now plotting histogram


# library
library(ggplot2)

# percentage calculations (percentage that they let stay)
percentage_data <- aggregate(justicesDecision == 0 ~ issueArea, data = lib_data_for_hist, FUN = function(x) sum(x) / length(x) * 100)

# plotting
ggplot(percentage_data, aes(x = issueArea, y = `justicesDecision == 0`)) +
  geom_bar(stat = "identity", fill = "red") + # change to blue for liberal, red to conservative
  geom_text(aes(label = paste0(round(`justicesDecision == 0`, 2), "%")), vjust = -0.5, size = 3, color = "black") +  # Add labels for each bar
  geom_text(aes(label = issueArea), vjust = 1.5, size = 3, color = "black") +  # Add issueArea labels at the bottom of each bar
  labs(x = "Issue Area", y = "Percentage of times conservative justices voted to overturn lower court", title = "Histogram of conservative justices by Issue Area") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))  # Rotate x-axis labels



# library
library(ggplot2)

# percentage calculations (percentage that they let stay)
percentage_data <- aggregate(justicesDecision == 0 ~ issueArea, data = lib_data_for_hist, FUN = function(x) sum(x) / length(x) * 100)

# plotting
ggplot(percentage_data, aes(x = issueArea, y = `justicesDecision == 0`)) +
  geom_bar(stat = "identity", fill = "blue") +  # change to blue for liberal, red to conservative
  geom_text(aes(label = paste0(round(`justicesDecision == 0`, 2), "%")), vjust = -0.5, size = 3, color = "black") +  # Add labels for each bar
  geom_text(aes(label = issueArea), vjust = 1.5, size = 3, color = "black") +  # Add issueArea labels at the bottom of each bar
  labs(x = "Issue Area", y = "Percentage of times liberal justices voted to overturn lower court", title = "Histogram of liberal justices by Issue Area") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +  # Rotate x-axis labels
  ylim(0, 100)  # Set y-axis limits to range from 0 to 100