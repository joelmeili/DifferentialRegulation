# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(doParallel)
})

# load functions
source("code/04_differential_analysis/run_differential_analysis.R")
source("code/04_differential_analysis/prepare_brie.R")

# import sce data
sce_USA <- readRDS("kidney_mouse/03_data/mouse_simulation.rds")
sce_USA_DGE <- readRDS("kidney_mouse/03_data/mouse_simulation_DGE.rds")

# set group parameter
GROUP <- c("A", "B", "A", "B")

# convert sce from USA to US mode
sce_US <- convert_USA_to_US(sce_USA)
sce_US_DGE <- convert_USA_to_US(sce_USA_DGE)

# setup parallel
n_cores <- 8
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
prepare_brie(sce_US, FALSE, CLUSTERS, GROUP)
prepare_brie(sce_US_DGE, TRUE, CLUSTERS, GROUP)