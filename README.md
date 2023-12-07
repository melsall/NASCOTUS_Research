# NASCOTUS_Research
File Guide: 


**Setup.R** --> necessary installations of packages, run once at beginning  

**BlackAndWhitePartisanHeatmaps.R** - uses the liberal_dataset and the conservative_dataset. Generates a black and white heatmap of each using PCOR correlations (with correct outcomes on x-axis and predictors on y-axis).  

**composite_dataset.csv** - dataset (in csv form) that I made combining the SCDB dataset, and information on the political affiliations of the presidents.  

**composite_dataset.Rdata** - R's adaptation of composite_dataset.csv.  

**Conservative_Generate.R** - generates a red/green network graph for the conservative_data dataset using standard correlation matrix. Still working on eliminating correlations predictor-->predictor and outcome-->outcome.   

**GenerateCorrelationMatrix.R** - creates general correlation matrix (named cor_matrix) for the whole of composite_dataset (not separated by party).    

**DirectedGraph.R** - creates yellow/green directed graph w/ floating correlation coefficients for the data in cor_matrix (created in GenerateCorrelationMatrix.R).   

**General_Pcor.R** - creates a partial correlation heatmap for all variables regardless of political affiliations, still not adjusted so that variables are not repeated on x/y axes.   

**justice_affiliations.csv** - Political affiliations of the presdient who appointed each justice. Combined with SCDB to make composite_dataset.   

**Liberal_Generate.R** - generates a red/green network graph for the liberal_data dataset using standard correlation matrix. Still working on eliminating correlations predictor-->predictor and outcome-->outcome.
