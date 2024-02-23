**NASCOTUS_Research:**
**File Guide:**


**Setup.R** --> necessary installations of packages, run once at beginning  

**BlackAndWhitePartisanHeatmaps.R** - uses the liberal_dataset and the conservative_dataset. Generates a black and white heatmap of each using PCOR correlations (with correct outcomes on x-axis and predictors on y-axis).  

**composite_dataset.csv** - dataset (in csv form) that I made combining the SCDB dataset, and information on the political affiliations of the presidents.  

**composite_dataset.Rdata** - R's adaptation of composite_dataset.csv.  

**Conservative_Generate.R** - generates a red/green network graph for the conservative_data dataset using standard correlation matrix. Still working on eliminating correlations predictor-->predictor and outcome-->outcome.   

**GenerateCorrelationMatrix.R** - creates general correlation matrix (named cor_matrix) for the whole of composite_dataset (not separated by party).    

**DirectedGraph.R** - creates yellow/green directed graph w/ floating correlation coefficients for the data in cor_matrix (created in GenerateCorrelationMatrix.R).   

**General_Pcor.R** - creates a partial correlation heatmap for all variables regardless of political affiliations, still not adjusted so that variables are not repeated on x/y axes.   

**justice_affiliations.csv** - Political affiliations of the presdient who appointed each justice. Combined with SCDB to make composite_dataset.   

**Liberal_Generate.R** - generates a red/green network graph for the liberal_data dataset using standard correlation matrix. Still working on eliminating correlations predictor-->predictor and outcome-->outcome. Issue: had to 0 values in this correlation matrix because it has all predictors as columns AND rows and same for outcomes.

**PartisanProperCorrelationMatrixes.R** - creates two correlation matrixes, one called liberal_correlations and one called conservative_correlations. Have correct # of rows and columns and have the correlation matrixes between each predictor --> each outcome. Vital for use in making statistical comparison.
        - these matrixes created are essential for statistical comparison

**chiSquaredBaby.R** - makes baby dataset, performs chi-squared on baby dataset to ensure it is doing what I think it is doing. 

**GeneratePValMatrix.R** - makes a matrix of all the p-values between the different variables (using the two different matrices conservative/liberal data to see)

**RankPvalMatrix.R** - rank the p_val_matrix from least to greatest and print out the results. 

**UpheldAsPercentages.R** - printing percentages of times liberals/conservatives upheld

**proofChiSquaredWorks.R** - proves that my chiSquared test works when put against actual calculator.

**Partisan_Heatmap.R** - computes partial correlation and creates heatmap for parties individually

**OrganizingPcorData.R** - using the file Partisan_Heatmaps.R to make correlation matrixes that show the pcor correlations of a subset of predictor variables & outcome variables.

**GeneralLogisticRegression.R** - supposed to be a general logistic regression for my small dataset
**THROWAWAY FOLDER** 
**PartisanCorrelationMatrices** - in theory this file generate correlation matrices for the subsets of partisan data but it doesn't actually work

