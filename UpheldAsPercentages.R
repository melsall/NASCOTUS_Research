# Upheld as percentages
liberal_data_reversed <- liberal_data[liberal_data$caseDisposition == 3, ]

total_rows_liberal <- nrow(liberal_data)
reversed_rows <- nrow(liberal_data_reversed)
percentage <- (reversed_rows / total_rows_liberal) * 100  #percentage it

#print vals for liberal
print(paste("Percentage of time Liberals reversed:", percentage, "%"))

# and same for conservatives


conservative_data_reversed <- conservative_data[conservative_data$caseDisposition == 3, ]

total_rows_conservative <- nrow(conservative_data)
reversed_rows <- nrow(conservative_data_reversed)
percentage <- (reversed_rows / total_rows_conservative) * 100  # Convert to percentage

# print for conservatives
print(paste("Percentage of time Conservatives reversed:", percentage, "%"))
