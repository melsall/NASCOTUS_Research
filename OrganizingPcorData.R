# Using this file to extract from the PCor matrix created in Partisan_Heatmaps.R
# Values I want
# direction & issueArea, Lawtype, lcDispositionDirection.
# precedentAlteration (& following 3)

# I am going to make an empty dataframe with 2 columns (direction & precedentAlteration), and 3 rows. issueArea, lawType, lcDispositionDirection

#1. initialize your empty matrix

con_empty_matrix <- matrix(nrow = 2, ncol = 3)

 # I add column and row names
colnames(con_empty_matrix) <- c("issueArea", "lawType", "lcDispositionDirection")
rownames(con_empty_matrix) <- c("direction", "precedentAlteration")
  # honestly, I am just going to index in individually (I know this is lazy but like)
  # filling up my queen con_empty_matrix
con_empty_matrix["direction", "issueArea"] <- results_df_con["direction", "issueArea"]
con_empty_matrix["direction", "lawType"] <- results_df_con["direction", "lawType"]
con_empty_matrix["direction", "lcDispositionDirection"] <- results_df_con["direction", "lcDispositionDirection"]
con_empty_matrix["precedentAlteration", "issueArea"] <- results_df_con["precedentAlteration", "issueArea"]
con_empty_matrix["precedentAlteration", "lawType"] <- results_df_con["precedentAlteration", "lawType"]
con_empty_matrix["precedentAlteration", "lcDispositionDirection"] <- results_df_con["precedentAlteration", "lcDispositionDirection"]
# Liberal Matrix of Relevant Values

lib_empty_matrix <- matrix(nrow = 2, ncol = 3)

colnames(lib_empty_matrix) <- c("issueArea", "lawType", "lcDispositionDirection")
rownames(lib_empty_matrix) <- c("direction", "precedentAlteration")

# filling up my queen lib_empty_matrix
lib_empty_matrix["direction", "issueArea"] <- results_df_lib["direction", "issueArea"]
lib_empty_matrix["direction", "lawType"] <- results_df_lib["direction", "lawType"]
lib_empty_matrix["direction", "lcDispositionDirection"] <- results_df_lib["direction", "lcDispositionDirection"]
lib_empty_matrix["precedentAlteration", "issueArea"] <- results_df_lib["precedentAlteration", "issueArea"]
lib_empty_matrix["precedentAlteration", "lawType"] <- results_df_lib["precedentAlteration", "lawType"]
lib_empty_matrix["precedentAlteration", "lcDispositionDirection"] <- results_df_lib["precedentAlteration", "lcDispositionDirection"]
