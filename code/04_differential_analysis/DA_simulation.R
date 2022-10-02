# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(doParallel)
	library(DifferentialRegulation)
})

# load functions
source("code/04_differential_analysis/run_differential_analysis.R")
source("code/04_differential_analysis/prepare_brie.R")

# import sce data
sce_USA <- readRDS("kidney_mouse/03_data/mouse_simulation_data.rds")
sce_USA_DGE <- readRDS("kidney_mouse/03_data/mouse_simulation_DGE_data.rds")

# set group parameter
GROUP <- c("A", "B", "A", "B")

# convert sce from USA to US mode
convert_USA_to_US <- function (sce_USA) {
	temp <- sce_USA
	assay(temp, "spliced") <- assay(temp, "spliced") + 0.5 * assay(temp, "ambiguous")
	assay(temp, "unspliced") <- assay(temp, "unspliced") + 0.5 * assay(temp, "ambiguous")
	assay(temp, "ambiguous") <- NULL
	assay(temp, "TOT_counts") <- assay(temp, "spliced") + assay(temp, "unspliced")
	
	return (temp)
}

sce_US <- convert_USA_to_US(sce_USA)
sce_US_DGE <- convert_USA_to_US(sce_USA_DGE)

# setup parallel
n_cores <- 2
cl <- makeCluster(n_cores)
registerDoParallel(cl)

# DA parameters
CLUSTERS <- c("Adipocytes", "Epithelial cells", "Hepatocytes")
min_count <- 20

# run eisaR on the sce US mode
results_eisar <- run_analysis_eisar(sce_US, GROUP, CLUSTERS, min_count)
results_eisar_DGE <- run_analysis_eisar(sce_US_DGE, GROUP, CLUSTERS, min_count)

# saving the eisaR results
saveRDS(results_eisar, file = "kidney_mouse/03_data/eisar_results_sim.rds")
saveRDS(results_eisar_DGE, file = "kidney_mouse/03_data/eisar_results_DGE_sim.rds")

# prepare to run BRIE2
#prepare_brie(sce_US, FALSE, CLUSTERS, GROUP)
#prepare_brie(sce_US_DGE, TRUE, CLUSTERS, GROUP)

# run DEXSeq on the sce USA mode
results_dexseq <- run_analysis_dexseq(sce_US, GROUP, CLUSTERS, min_count)

# saving the DEXSeq results
saveRDS(results_dexseq, file = "kidney_mouse/03_data/dexseq_results_sim.rds")
saveRDS(results_dexseq_DGE, file = "kidney_mouse/03_data/dexseq_results_DGE_sim.rds")

# run DifferentialRegulation on the sce USA mode
design <- data.frame("sample" = sce_USA$sample_id, "group" = sce_USA$group)
design_DGE <- data.frame("sample" = sce_USA_DGE$sample_id, "group" = sce_USA_DGE$group)

pb_counts <- compute_PB_counts(sce_USA, design = design, EC_list = NULL)
pb_countsDGE <- compute_PB_counts(sce_USA_DGE, design = design_DGE, EC_list = NULL)

results_diff_reg <- DifferentialRegulation(pb_counts, EC = FALSE, n_cores = 8)
results_diff_reg_DGE <- DifferentialRegulation(pb_counts_DGE, EC = FALSE, n_cores = 8)

# saving the diffreg results
saveRDS(results_diff_reg, file = "kidney_mouse/03_data/diff_reg_results_sim.rds")
saveRDS(results_diff_reg, file = "kidney_mouse/03_data/diff_reg_results_DGE_sim.rds")