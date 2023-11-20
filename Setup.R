#script setup 
install.packages("networktools")
install.packages("smacof")
install.packages("MPsychoR")
install.packages("psych")
install.packages("eigenmodel")
install.packages("dplyr")
install.packages("NetworkComparisonTest")
install.packages("ggraph")
install.packages("igraph")

# separating conservative and liberal data

#LIBERAL presidents
liberal_data <- composite_dataset[composite_dataset$presAffiliation == 0, ]

#Conservative presidents
conservative_data <- composite_dataset[composite_dataset$presAffiliation == 1, ]

