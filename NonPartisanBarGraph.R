# NEW FILE FOR CREATING BAR GRAPHS:

# this is the data you should be using: 
data_for_regression

# first I want to print out the percentages of 1s/0s in each column
num_zeros <- sum(data_for_regression$justicesDecision == 0, na.rm = TRUE)
print("The percentage of TOTAL CASES in which justices voted to let the case stay:" )
print(num_zeros/(length(data_for_regression$justicesDecision)) * 100)

# Now I want to make a bar graph with this data - nothing has been removed yet (NOT PARTISAN YET)
    # 1.  loading libraries
library(ggplot2)
library(dplyr)

total_count <- nrow(data_for_regression)
      # 2. Calculating percents of 0s and 1s
summary_data <- data_for_regression %>%
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
  labs(x = "Justices Decision", y = "Percentage of Total", title = "Percentage of Total by Justices Decision") +
  scale_x_discrete(labels = c("Voted to stay", "Voted to overturn")) +  
  theme_minimal()

  
print(plot)

# Now I am going to repeat this process, but I will remove the entries where lcDispositionDirection = 1

no_lib_disp <- subset(data_for_regression, lcDispositionDirection != 2)

# printing some of our statistics

num_zeros <- sum(no_lib_disp$justicesDecision == 1, na.rm = TRUE)
print("The percentage of TOTAL CASES in which justices voted to let the case stay, NO LIBERAL DISPOSITION:" )
print(num_zeros/(length(no_lib_disp$justicesDecision)) * 100)


total_count <- nrow(no_lib_disp)
# 2. Calculating percents of 0s and 1s
summary_data <- no_lib_disp %>%
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
  labs(x = "Justices Decision", y = "Percentage of Total", title = "Percentage of Total by Justices Decision, no cases with liberal disp") +
  scale_x_discrete(labels = c("Voted to stay", "Voted to overturn")) +  
  theme_minimal()


print(plot)


# now I will repeat but with no conservative dispositions







no_con_disp <- subset(data_for_regression, lcDispositionDirection != 1)

# printing some of our statistics

num_zeros <- sum(no_con_disp$justicesDecision == 0, na.rm = TRUE)
print("The percentage of TOTAL CASES in which justices voted to let the case stay, NO LIBERAL DISPOSITION:" )
print(num_zeros/(length(no_con_disp$justicesDecision)) * 100)


total_count <- nrow(no_con_disp)
# 2. Calculating percents of 0s and 1s
summary_data <- no_con_disp %>%
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
  labs(x = "Justices Decision", y = "Percentage of Total", title = "Percentage of Total by Justices Decision, no cases with conservative disp") +
  scale_x_discrete(labels = c("Voted to stay", "Voted to overturn")) +  
  theme_minimal()


print(plot)










