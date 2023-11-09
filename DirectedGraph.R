# Function: creating directed graph with floating correlation coefficients
library("qgraph")
library("igraph")

#initializing empty graph
g <- graph.empty(n = 0, directed = TRUE)

# making predictors + outcomes
predictors <- c("caseSource", "petitioner", "respondent")
outcomes <- c("partyWinning", "decisionDirection", "issueArea")

g <- add_vertices(g, n = length(predictors), name = predictors, color = "yellow")
g <- add_vertices(g, n = length(outcomes), name = outcomes, color = "green")

# making edges that are correlation coeffs 
for (p in predictors) {
  for (o in outcomes) {
    weight <- cor_matrix[p, o]
    g <- add_edges(g, edges = c(p, o), weight = weight)
  }
}

# plotting 
plot(g, layout = layout.circle, vertex.label.color = c("black", "black"), edge.label = E(g)$weight)
