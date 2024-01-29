# splitting to overturn. See if splitting the data to overturn makes it look like their is a huge difference in the bar plots
# 0  = not favorable for petitioner, 1 = favorable for petitioner.

# splitting conservative data into upheld/did not uphold a case
liberal_upheld   <- liberal_data[liberal_data$partyWinning == 0, ]
liberal_overturned <- liberal_data[liberal_data$partyWinning == 1, ]

# Assuming liberal_data is a data frame and you want to select columns 'column1', 'column2', and 'column3'
selected_columns <- c("issueArea", "lawType", "lcDispositionDirection")

# another subset of the upheld liberal data using only the selected columns. 
subset_liberal_data <- liberal_upheld[, selected_columns, drop = FALSE]
subset_liberal_data<- na.omit(subset_liberal_data)


# conservative subsets 
subset_conservative_data <- conservative_upheld[, selected_columns, drop = FALSE]
subset_conservative_data<- na.omit(subset_conservative_data)

print(subset)
# trying to make a contingency table
#contingency_table <- table(subset_liberal_data$issueArea, subset_conservative_data$issueArea)

#
#print(contingency_table)
# attempting to perform chi-squared test of homoegeneity
chi_square_test_result <- chisq.test(total)

# displaying test result. 
print(chi_square_test_result)



# accessing the p_value
p_value <- chi_square_test_result$p.value

# Print the p-value
# 
print("new p value")
print(p_value)


# spliting conservative data into upheld/not upheld a case
conservative_upheld <- conservative_data[conservative_data$partyWinning == 0, ]
conservative_overturned <- conservative_data[conservative_data$partyWinning == 1, ]


# printing amount of rows in each case of uphelds, commenting out for now because it is annoying
# num_rows <- nrow(liberal_upheld)
# print(num_rows)
# num_rows2 <- nrow(conservative_upheld)
# print(num_rows2)