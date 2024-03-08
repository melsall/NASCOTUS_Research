# base statistics

value_to_count <- '1' # Replace 3 with the specific value you want to count
count <- length(which(case_subset_data$caseDisposition == value_to_count))
print(count)
