# clean environment
rm(list = ls())

# load libraries
suppressPackageStartupMessages({
	library(UpSetR)
})

# load functions
source("code/04_differential_analysis/plot_performance.R")

# load ground truth
sce <- readRDS("kidney_mouse/03_data/mouse_simulation_data.rds")
sce_DGE <- readRDS("kidney_mouse/03_data/mouse_simulation_DGE_data.rds")
truth <- metadata(sce)$truth

# load results from eisaR
results_eisar <- readRDS(file = "kidney_mouse/03_data/eisar_results.rds")
results_eisar_DGE <- readRDS(file = "kidney_mouse/03_data/eisar_results_DGE.rds")

# load results from BRIE2
results_brie <- read_results_brie(CLUSTERS = c("Adipocytes"))


# merge results from eisaR and BRIE2
results_merged <- merge(results_eisar, results_brie, by = c("Gene_id", "Cell_type"))
results_merged <- merge(results_merged, truth, by = c("Gene_id", "Cell_type"))

# show ROC and TPR/FPR curves
SAVE_FILE_PATH <- "figures/simulation/initial_simulation"

DF_COBRA <- COBRAData(pval = data.frame(
	eisaR = results_merged$p_eisaR,
	BRIE2 = results_merged$is_A_pval),
	padj = data.frame(
		eisaR = results_merged$p_eisaR_adj,
		BRIE2 = results_merged$is_A_FDR),
	truth = data.frame(status = results_merged$truth))

plot_performance(DF_COBRA, SAVE_FILE_PATH)
