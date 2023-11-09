#load libraries
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

#currently using fake columns that don't mean anything to figure out how to generate columns
netdt1 <- select(dt, petitioner:certReason)
netdt2 <- select(dt, certReason:caseDisposition)
netdt3 <- select(dt, partyWinning:issueArea)


cor1 <- cor_auto(netdt1, detectOrdinal = FALSE)

cor2 <- cor_auto(netdt2, detectOrdinal = FALSE)

cor.diff1 <- cor1-cor2
#print
print(cor.diff1)
# generating correlation graph of variables stored in corr.diff1
qgraph(cor.diff1, vsize = 16, title = "Correlation Controls", labels = colnames(cor.diff1))

cor(netdt1, netdt2, method = c("pearson", "kendall", "spearman"))
##### 

