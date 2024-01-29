# In this script I am making a baby dataset and creating a a chi-squared test to ensure the test is doing what I believe it is doing

# TEST 1. Expected Result: .97
# creating my tiny baby datset
baby_data <- data.frame(
  Gender = c("Rat", "Mouse"),
  Group1 = c(30, 20),
  Group2 = c(35, 25),
  Group3 = c(30, 20)
)

# printing to make sure it's right 
print(baby_data)

# chi squared test yay
chisq_test_result <- chisq.test(baby_data[, 2:ncol(baby_data)])

# printing result
print(chisq_test_result) # should be .97, is .97

#TEST 2: (should be 0)
# creating my tiny baby datset
baby_data <- data.frame(
  Gender = c("Rat", "Mouse"),
  Group1 = c(30, 20),
  Group2 = c(35, 25),
  Group3 = c(30, 20),
  Group4 = c(30, 19),
  Group5 = c(35, 15),
  Group6 = c(70, 9),
  Group7 = c(18, 12),
  Group8 = c(2, 1),
  Group9 = c(1, 2),
  Group10 = c(9, 0)
)

# printing to make sure it's right 
print(baby_data)

# chi squared test yay
chisq_test_result <- chisq.test(baby_data[, 2:ncol(baby_data)])

# printing result
print(chisq_test_result) # should be 0, is 0

