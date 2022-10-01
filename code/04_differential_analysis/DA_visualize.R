# clean environment
rm(list = ls())

# load libraries
suppressPackageStartupMessages({
	library(UpSetR)
})

# load functions
source("code/04_differential_analysis/plot_performance.R")

# load results from eisaR
results_eisar <- readRDS(file = "kidney_mouse/03_data/eisar_results.rds")
results_eisar_DGE <- readRDS(file = "kidney_mouse/03_data/eisar_results_DGE.rds")

# load results from BRIE2
results_brie <- read_results_brie(CLUSTERS = c("Adipocytes"))


# merge results from eisaR and BRIE2
results_merged <- merge(results_eisar, results_brie, by = c("Gene_id", "Cell_type"))

# show upset plots


# show ROC and TPR/FPR curves