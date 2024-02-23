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
install.packages("viridisLite")
install.packages("reshape2")
install.packages("caret")
install.packages("randomForest")

# separating conservative and liberal data
library("caret")
library("MASS")
library("dplyr")
#LIBERAL presidents
liberal_data <- composite_dataset[composite_dataset$presAffiliation == 0, ]

#Conservative presidents
conservative_data <- composite_dataset[composite_dataset$presAffiliation == 1, ]

