# Conducts a chisquared test. Compares how many times certain issues caused a liberal to alter precedent, and certain issues caused a conservative to alter precedent. 
# NOTES ON VALUES: 0 -- no precedent alteration. 1 -- precedent alteration
#           combinations that would mean that a justice wanted to alter precedent: majority (2), precedent alteration (1)


library(dplyr)

#STEP 1: Data Formatting
  # make 2 datasets containing the following columns: issueArea, majority, precedentAlteration. one liberal one conservative. 
# creating baby liberal/connservative datasets
selected_columns <- c("issueArea", "precedentAlteration", "majority")
lib_prec_chi_raw <- liberal_data[, selected_columns]
con_prec_chi_raw <- conservative_data[, selected_columns]

# filtering datasets to only times when they voted to alter precedent
lib_prec_chi <- lib_prec_chi_raw %>%
  filter(majority == 2, precedentAlteration == 1)
  
con_prec_chi <- con_prec_chi_raw %>%
  filter(majority == 2, precedentAlteration == 1)

# now we make tables.
con_count_table <- con_prec_chi %>%
  filter(majority == 2, precedentAlteration == 1)
  # options are numbers 1-12. 
  possible_numbers <- 1:12
  
# count table making
con_issueArea_counts <- table(con_prec_chi$issueArea)

# list of counts for each possible number, including 0 for missing numbers
con_list_of_counts <- integer(length(possible_numbers))
con_list_of_counts[match(names(con_issueArea_counts), possible_numbers)] <- as.integer(con_issueArea_counts)

# replacing 0 vals w/ NA... lowkey you don't need anymore. 
con_list_of_counts[is.na(con_list_of_counts)] <- 0

con_count_matrix <- cbind(issueArea = possible_numbers, conservative = con_list_of_counts)

#### create same counts matrix data setup for liberal.

lib_count_table <- lib_prec_chi %>%
  filter(majority == 2, precedentAlteration == 1)

# options are numbers 1-12. 
possible_numbers <- 1:12
# creating counts matrix
lib_issueArea_counts <- table(lib_prec_chi$issueArea)

# creating list of counts for each possible number
lib_list_of_counts <- integer(length(possible_numbers))
lib_list_of_counts[match(names(lib_issueArea_counts), possible_numbers)] <- as.integer(lib_issueArea_counts)

# making NA 0 so those counts still go in. 
lib_list_of_counts[is.na(lib_list_of_counts)] <- 0

lib_count_matrix <- cbind(issueArea = possible_numbers, liberal = lib_list_of_counts)

# combine con_count_matrix and lib_count_matrix into a single matrix
combined_matrix <- cbind(conservative = con_count_matrix[, 2], liberal = lib_count_matrix[, 2])

# STEP 2: Now that combining is over, we can do the chisquared test.

# Assuming 'your_matrix' is your matrix
combined_matrix <- combined_matrix[-11, , drop = FALSE]


chi_columns <- combined_matrix[, c("conservative", "liberal")]

print(chi_columns)
# Perform chi-squared test
chisq_test_result <- chisq.test(chi_columns)

# making a chisq row with my contributions.
contributions <- chisq_test_result$observed - chisq_test_result$expected

# adding a total columnin contributions
total_contributions <- cbind(contributions, Total = rowSums(contributions))

# result printing.
print(total_contributions)
print(chisq_test_result)
