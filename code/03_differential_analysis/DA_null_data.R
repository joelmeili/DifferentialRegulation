# clean environment
rm(list = ls())

# load functions
source("code/03_differential_analysis/run_differential_analysis.R")
source("code/03_differential_analysis/prepare_brie.R")

# load data
sce <- readRDS("kidney_mouse/03_data/mouse_data_fry_USA.rds")
sce_50 <- readRDS("kidney_mouse/03_data/mouse_data_fry_50_50.rds")

# run DA on the mouse data
min_count <- 20

GROUPS <- list(c("A", "A", "B", "B"),
							 c("A", "B", "A", "B"),
							 c("A", "B", "B", "A"))

CLUSTERS <- sort(unique(sce$cell_type))[table(sce$cell_type) >= 100]

# run eisaR on the US count data
RESULTS_EISAR <- lapply(GROUPS, function (GROUP) {
	run_analysis_eisar(sce = sce_50, GROUP = GROUP, CLUSTERS = CLUSTERS)
})

eisar_RES <- list(RESULTS_EISAR[[1]], RESULTS_EISAR[[2]], RESULTS_EISAR[[3]])

# run DEXSeq on the USA count data
RESULTS_DEXSEQ <- lapply(GROUPS, function (GROUP) {
	run_analysis_dexseq(sce = sce, GROUP = GROUP, CLUSTERS = CLUSTERS)
})

dexseq_RES <- list(RESULTS_DEXSEQ[[1]], RESULTS_DEXSEQ[[2]], RESULTS_DEXSEQ[[3]])

# save results
saveRDS(eisaR_RES, file = "kidney_mouse/03_data/eisar_res_US.rds")
saveRDS(dexseq_RES, file = "kidney_mouse/03_data/dexseq_res_USA.rds")

# prepare BRIE
prepare_brie(sce_50)