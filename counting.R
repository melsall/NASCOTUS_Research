# counting how many times liberals voted to let a case stay vs. conservatives

lib <- cleaned_composite_dataset[cleaned_composite_dataset$presAffiliation == 0, ]


con <- cleaned_composite_dataset[cleaned_composite_dataset$presAffiliation == 1, ]

count_0_lib <- sum(lib$justicesDecision == 0)
#print(lib$justicesDecision)
justice_decision_counts <- table(con$justicesDecision)
num_lib_entries = length(lib$justicesDecision)
print(justice_decision_counts)

#print(count_0_lib/lib$justicesDecision * 100)


# Print the result
#print("Percentage of times 'justicesDecision' has a value of 0 in 'lib' dataset:", percent_0_con, "%\n")
#print("Percentage of times 'justicesDecision' has a value of 0 in 'lib' dataset:", percent_0_lib, "%\n")
#cat("Percentage of times 'justicesDecision' has a value of 0 in 'lib' dataset: ", round(percent_0_lib, 2), "%\n")