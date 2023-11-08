#install necessary packages
# install.packages("networktools")
# install.packages("smacof")
# install.packages("MPsychoR")
# install.packages("psych")
# install.packages("eigenmodel")
# install.packages("dplyr")
# install.packages("NetworkComparisonTest")
#install.packages("ppcor")
require("networktools")
library("ppcor")
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
netdt1 <- select(dt, petitioner:respondent)
netdt2 <- select(dt, certReason:caseDisposition)
netdt3 <- select(dt, partyWinning:issueArea)

