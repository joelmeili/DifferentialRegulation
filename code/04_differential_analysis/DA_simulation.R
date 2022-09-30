# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(doParallel)
})

# load functions
source("code/04_differential_analysis/run_differential_analysis.R")

# import sce data
sce_USA <- readRDS("kidney_mouse/03_data/mouse_simulation_data.rds")
sce_USA_DGE <- readRDS("kidney_mouse/03_data/mouse_simulation_DGE_data.rds")

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
n_cores <- 8
cl <- makeCluster(n_cores)
registerDoParallel(cl)

# DA parameters
CLUSTERS <- c("Adipocytes", "Epithelial cells", "Hepatocytes")
GROUP <- c("A", "B", "A", "B")
min_count <- 20

# run eisaR on the sce US mode
results_eisar <- run_analysis_eisar(sce_US, GROUP, CLUSTERS, min_count)
results_eisar_DGE <- run_analysis_eisar(sce_US_DGE, GROUP, CLUSTERS, min_count)

# saving the eisar results
saveRDS(results_eisar, file = "kidney_mouse/03_data/eisar_results.rds")
saveRDS(results_eisar_DGE, file = "kidney_mouse/03_data/eisar_results_DGE.rds")