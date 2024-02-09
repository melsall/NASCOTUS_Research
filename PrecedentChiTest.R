# I want to see what areas contribute the most to an alteration of precedent. # would be like. how many times did a liberal alter precedent with their vote on a Crim P case.
# 0 -- no precedent alteration. 1 -- precedent alteration
# combinations that would mean that a liberal justice wanted to alter precedent. 
# majority (2), precedent alteration (1)



library(dplyr)

# 1. make 2 datasets containing the following columns: issueArea, majority, precedentAlteration. one liberal one conservative. 
# creating baby liberal/connservative datasets
selected_columns <- c("issueArea", "precedentAlteration", "majority")
lib_prec_chi_raw <- liberal_data[, selected_columns]
con_prec_chi_raw <- conservative_data[, selected_columns]

# filtering datasets to only times when they voted to alter precedent
lib_prec_chi <- lib_prec_chi_raw %>%
  filter(majority == 2, precedentAlteration == 1)
  
con_prec_chi <- con_prec_chi_raw %>%
  filter(majority == 2, precedentAlteration == 1)

# 
con_count_table <- con_prec_chi %>%
  filter(majority == 2, precedentAlteration == 1)
  # options are numbers 1-14. 
  possible_numbers <- 1:14
  
# table making
con_issueArea_counts <- table(con_prec_chi$issueArea)

# Create a list of counts for each possible number, including 0 for missing numbers
con_list_of_counts <- integer(length(possible_numbers))
con_list_of_counts[match(names(con_issueArea_counts), possible_numbers)] <- as.integer(con_issueArea_counts)

# Replace NA with 0 for missing numbers
con_list_of_counts[is.na(con_list_of_counts)] <- 0

con_count_matrix <- cbind(issueArea = possible_numbers, conservative = con_list_of_counts)


#### DO SAME THING FOR LIBERALLLLL


lib_count_table <- lib_prec_chi %>%
  filter(majority == 2, precedentAlteration == 1)
# options are numbers 1-14. 
possible_numbers <- 1:14
# Assuming con_prec_chi is your dataset with a column named issueArea
lib_issueArea_counts <- table(lib_prec_chi$issueArea)

# Create a list of counts for each possible number, including 0 for missing numbers
lib_list_of_counts <- integer(length(possible_numbers))
lib_list_of_counts[match(names(lib_issueArea_counts), possible_numbers)] <- as.integer(lib_issueArea_counts)

# making NA 0 so those counts still go in. 
lib_list_of_counts[is.na(lib_list_of_counts)] <- 0

lib_count_matrix <- cbind(issueArea = possible_numbers, liberal = lib_list_of_counts)

# combine con_count_matrix and lib_count_matrix into a single matrix
combined_matrix <- cbind(conservative = con_count_matrix[, 2], liberal = lib_count_matrix[, 2])

# view the result
print(combined_matrix)
