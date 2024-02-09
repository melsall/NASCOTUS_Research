
# making the counts matrix. each row = issueArea value. columns = conservative, liberal.

# counting the combos of each issuearea and majority
lib_count_table <- lib_prec_chi %>%
  filter(majority == 2, precedentAlteration == 1) %>%
  count(issueArea)

# making my matrix with the counts
lib_count_matrix <- matrix(lib_count_table$n, ncol = 1, dimnames = list(lib_count_table$issueArea, "liberal"))


