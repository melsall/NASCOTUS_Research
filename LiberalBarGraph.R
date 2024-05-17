# liberal bar graphs
lib_bar_data <- subset(cleaned_composite_dataset, presAffiliation != 1)


# printing stats I want to know
num_zeros <- sum(lib_bar_data$justicesDecision == 0, na.rm = TRUE)
print("Liberals: % of times justices voted to let case stay" )
print(num_zeros/(length(lib_bar_data$justicesDecision)) * 100)


total_count <- nrow(lib_bar_data)
# 2. Calculating percents of 0s and 1s
summary_data <- lib_bar_data %>%
  group_by(justicesDecision) %>%
  summarise(count = n()) %>%
  mutate(percent = count / total_count * 100)

print(summary_data)
# 3. Plotting said data
plot <- ggplot(summary_data, aes(x = factor(justicesDecision), y = percent, fill = factor(justicesDecision))) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("blue", "red"), name = "Justices Decision", labels = c("0", "1")) +
  scale_y_continuous(labels = scales::number_format(accuracy = 0.1),  # formatting for 1 dec place
                     breaks = seq(0, 100, by = 5)) +  # 5% intervals
  labs(x = "Justices Decision", y = "Percentage of Total", title = "Percentage of Total LIBERAL justices by Justices Decision") +
  scale_x_discrete(labels = c("Voted to stay", "Voted to overturn")) +  
  theme_minimal()

print(plot)


# taking out every time that the lower court disposition was liberal


lib_bar_data <- subset(lib_bar_data, lcDispositionDirection != 2)


# printing stats I want to know
num_zeros <- sum(lib_bar_data$justicesDecision == 0, na.rm = TRUE)
print("Liberals: % of times justices voted to let case stay" )
print(num_zeros/(length(lib_bar_data$justicesDecision)) * 100)


total_count <- nrow(lib_bar_data)
# 2. Calculating percents of 0s and 1s
summary_data <- lib_bar_data %>%
  group_by(justicesDecision) %>%
  summarise(count = n()) %>%
  mutate(percent = count / total_count * 100)

print(summary_data)
# 3. Plotting said data
plot <- ggplot(summary_data, aes(x = factor(justicesDecision), y = percent, fill = factor(justicesDecision))) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("blue", "red"), name = "Justices Decision", labels = c("0", "1")) +
  scale_y_continuous(labels = scales::number_format(accuracy = 0.1),  # formatting for 1 dec place
                     breaks = seq(0, 100, by = 5)) +  # 5% intervals
  labs(x = "Justices Decision", y = "Percentage of Total", title = "Percentage of Total LIBERAL justices by Justices Decision, liberal lcd removed") +
  scale_x_discrete(labels = c("Voted to stay", "Voted to overturn")) +  
  theme_minimal()

print(plot)


