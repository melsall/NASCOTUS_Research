# This is the file I am using to make my outcome variable make sense. 
# Coded as 0 in the outcome, means that they let the case stay.
# Coded as 1 in the outcome, means that they REVERSED the case. 

library(dplyr)

# making a copy to not disrupt my original data
cleaned_composite_dataset <- composite_dataset

# changing all of the 'stayed' values to 0 in caseDisposition column
cleaned_composite_dataset <- cleaned_composite_dataset %>%
  mutate(caseDisposition = if_else(caseDisposition %in% c(1, 2, 5, 10, 8), 0, caseDisposition))

# changing all of the 'reversed' variables to 1 in caseDisposition column
cleaned_composite_dataset <- cleaned_composite_dataset %>%
  mutate(caseDisposition = if_else(caseDisposition %in% c(3, 4), 0, caseDisposition))

# adding a new column called justicesDecision to cleaned_composite_dataset. All values are NA for now.
cleaned_composite_dataset$justicesDecision <- NA

# if the majority=1 & cd=1, they LET THE CASE STAY. CODE AS 0.
cleaned_composite_dataset$justicesDecision[
  with(cleaned_composite_dataset, majority == 1 & caseDisposition == 1)
] <- 0

# if majority=2 & cd=0, they LET THE CASE STAY. CODE AS 0.
cleaned_composite_dataset$justicesDecision[
  with(cleaned_composite_dataset, majority == 2 & caseDisposition == 0)
] <- 0

# if majority=1 & cd=0, they REVERSED CASE. CODE AS 1.
cleaned_composite_dataset$justicesDecision[
  with(cleaned_composite_dataset, majority == 1 & caseDisposition == 0)
] <- 1

#if majority=2 & cd=1, they REVERSED THE CASE. CODE AS 1.
cleaned_composite_dataset$justicesDecision[
  with(cleaned_composite_dataset, majority == 2 & caseDisposition == 1)
] <- 1
