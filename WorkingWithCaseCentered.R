# work, grouping data

# making some stuff NA

# replace 1, 9, 10, and 11 with NA in the caseDisposition column
Case_Centered_Data$caseDisposition <- ifelse(Case_Centered_Data$caseDisposition %in% c(1, 9, 10, 11), NA, Case_Centered_Data$caseDisposition)


# REVERSED VALUES: replace 3, 4, 5, and 8 with 0 in the caseDisposition column (because they are all overturned)
Case_Centered_Data$caseDisposition <- ifelse(Case_Centered_Data$caseDisposition %in% c(3, 4, 5, 8), 0, Case_Centered_Data$caseDisposition)

# STAY: replace 2s with 1s (for binary vibes)
Case_Centered_Data$caseDisposition[Case_Centered_Data$caseDisposition == 2] <- 1

# create a subset with only the columns caseId and caseDisposition
case_subset_data <- Case_Centered_Data[, c("caseId", "caseDisposition")]

# Print the subset
print(case_subset_data)



