#install necessary packages
# install.packages("networktools")
# install.packages("smacof")
# install.packages("MPsychoR")
# install.packages("psych")
# install.packages("eigenmodel")
# install.packages("dplyr")
# install.packages("NetworkComparisonTest")
require("networktools")
library("MPsychoR")
library("smacof")
library("qgraph")
library("psych")
library("eigenmodel")
library("dplyr")
library("ggplot2")
library("bootnet")
library("qgraph")
library("networktools")
library("IsingSampler")
library("IsingFit")
library("bootnet")

#read in data as a csv
dt <- read.csv("composite_dataset.csv", header=TRUE)
#
netdt1 <- select(dt, chief:caseSource)
netdt2 <- select(dt, certReason:precedentAlteration)
netdt3 <- select(dt, issue:lawSupp)


cor1 <- cor_auto(netdt1, detectOrdinal = FALSE)

cor2 <- cor_auto(netdt2, detectOrdinal = FALSE)

#cor.diff1 <- cor1-cor2

# qgraph(cor.diff1, vsize = 16, title = "Correlation Controls-PWADHD")
# cor(netdt1, netdt2, method = c("pearson", "kendall", "spearman"))
