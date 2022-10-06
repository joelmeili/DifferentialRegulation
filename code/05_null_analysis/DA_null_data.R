# clean environment
rm(list = ls())

# load functions
source("code/04_differential_analysis/run_differential_analysis.R")
source("code/04_differential_analysis/prepare_brie.R")

# load data
sce_USA <- readRDS("kidney_mouse/03_data/mouse_data_fry_USA.rds")

# run DA on the mouse data
min_count <- 20

GROUPS <- list(c("A", "A", "B", "B"),
							 c("A", "B", "A", "B"),
							 c("A", "B", "B", "A"))

CLUSTERS <- sort(unique(sce_USA$cell_type))[table(sce_USA$cell_type) >= 100]

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

# run eisaR on the US count data
start <- Sys.time()
RESULTS_EISAR <- lapply(GROUPS, function (GROUP) {
	run_analysis_eisar(sce = sce_US, GROUP = GROUP, CLUSTERS = CLUSTERS, min_count = min_count)
})
end <- Sys.time()
eisar_time <- end - start

eisar_RES <- list(RESULTS_EISAR[[1]], RESULTS_EISAR[[2]], RESULTS_EISAR[[3]])

# run DEXSeq on the US count data
start <- Sys.time()
RESULTS_DEXSEQ <- lapply(GROUPS, function (GROUP) {
	run_analysis_dexseq(sce = sce_US, GROUP = GROUP, CLUSTERS = CLUSTERS, min_count = min_count, method = "US")
})
end <- Sys.time()
dexseq_time <- end -start

dexseq_RES <- list(RESULTS_DEXSEQ[[1]], RESULTS_DEXSEQ[[2]], RESULTS_DEXSEQ[[3]])

# save results
saveRDS(eisar_RES, file = "kidney_mouse/03_data/eisar_res_null.rds")
saveRDS(dexseq_RES, file = "kidney_mouse/03_data/dexseq_res_US_null.rds")