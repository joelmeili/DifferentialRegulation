# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(SummarizedExperiment)
})

# load functions
source("code/04_differential_analysis/plot_performance.R")

# load ground truth
sce <- readRDS("kidney_mouse/03_data/mouse_simulation.rds")
sce_DGE <- readRDS("kidney_mouse/03_data/mouse_simulation_DGE.rds")
truth <- metadata(sce)$truth
truth_DGE <- metadata(sce_DGE)$truth

# define clusters
CLUSTERS <- c("Adipocytes", "Epithelial cells", "Hepatocytes")

# load results from eisaR
results_eisar <- readRDS(file = "kidney_mouse/03_data/eisar_results_sim.rds")
results_eisar_DGE <- readRDS(file = "kidney_mouse/03_data/eisar_results_DGE_sim.rds")

# load results from BRIE2
results_brie <- read_results_brie(CLUSTERS, DGE = FALSE)
results_brie_DGE <- read_results_brie(CLUSTERS, DGE = TRUE)

# merge results
results_merged <- merge(results_eisar, results_brie, by = c("Gene_id", "Cell_type"))
results_merged_DGE <- merge(results_eisar_DGE, results_brie_DGE, by = c("Gene_id", "Cell_type"))
results_merged <- merge(results_merged, truth, by = c("Gene_id", "Cell_type"))
results_merged_DGE <- merge(results_merged_DGE, truth_DGE, by = c("Gene_id", "Cell_type"))

# show ROC and TPR/FPR curves
SAVE_FILE_PATH <- "figures/simulation/naive_simulation"

DF_COBRA <- COBRAData(pval = data.frame(
	eisaR = results_merged$p_eisaR,
	BRIE2 = results_merged$is_A_pval),
	padj = data.frame(
		eisaR = results_merged$p_eisaR_adj,
		BRIE2 = results_merged$is_A_FDR),
	truth = data.frame(status = results_merged$truth))

plot_performance(DF_COBRA, SAVE_FILE_PATH)

SAVE_FILE_PATH <- "figures/simulation/naive_simulation_DGE"

DF_COBRA <- COBRAData(pval = data.frame(
	eisaR = results_merged_DGE$p_eisaR,
	BRIE2 = results_merged_DGE$is_A_pval),
	padj = data.frame(
		eisaR = results_merged_DGE$p_eisaR_adj,
		BRIE2 = results_merged_DGE$is_A_FDR),
	truth = data.frame(status = results_merged_DGE$truth_union))

plot_performance(DF_COBRA, SAVE_FILE_PATH)