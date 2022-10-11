# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(ggplot2)
	library(doParallel)
	library(anndata)
	library(DifferentialRegulation)
})

# load relevant functions
source("code/04_differential_analysis/run_differential_analysis.R")
source("code/04_differential_analysis/prepare_brie.R")

# load data
sce_USA <- readRDS("kidney_mouse/03_data/mouse_data_fry_USA.rds")

# run DA on the mouse data
min_count <- 20

GROUP <- list(c("A", "A", "B", "B"),
							c("A", "B", "A", "B"),
							c("A", "B", "B", "A"))

CLUSTERS <- c("Adipocytes", "Epithelial cells", "Hepatocytes")

sce_US <- convert_USA_to_US(sce_USA)

# define parallel
cl <- makeCluster(3)
registerDoParallel(cl, cores = 3)

# run eisaR on the US count data
eisar_time <- lapply(GROUPS, function (GROUP) {
	start <- Sys.time()
	run_analysis_eisar(sce = sce_US, GROUP = GROUP, CLUSTERS = CLUSTERS, min_count = min_count)
	end <- Sys.time()
	return (end - start)
})
saveRDS(eisar_time, "kidney_mouse/03_data/eisar_bench.rds")

# run DEXSeq on the USA count data
dexseq_time <- lapply(GROUPS, function (GROUP) {
	start <- Sys.time()
	run_analysis_dexseq(sce = sce_US, GROUP = GROUP, CLUSTERS = CLUSTERS, min_count = min_count, method = "USA")
	end <- Sys.time()
	return (end - start)
})
saveRDS(dexseq_time, "kidney_mouse/03_data/dexseq_bench.rds")

# run BRIE2 on the US count data
brie_time <- lapply(GROUPS, function (GROUP) {
	start <- Sys.time()
	for (i in 1:length(CLUSTERS)) {
		# filter based on cell type
		sce_temp <- sce_US[, sce_US$cell_type == CLUSTERS[[i]]]
		
		cl <- sapply(strsplit(CLUSTERS[[i]], " "), function (x) paste0(x, collapse = "_"))
		
		# set group attribute
		sce_temp$group <- ifelse(sce_temp$sample_id %in% which(GROUP == "A"), "A", "B")
		
		# remove lowly expressed genes: at least 10 non-zero cells:
		filter <- (rowSums(assays(sce_temp)$TOT_counts[, sce_temp$group == "A"] > 0) >= min_count) & 
			(rowSums(assays(sce_temp)$TOT_counts[, sce_temp$group == "B"] > 0) >= min_count)
		
		sce_temp <- sce_temp[filter, ]
		
		ad <- AnnData(
			X = t(assay(sce_temp, "spliced")),
			layers = list(
				spliced = t(assay(sce_temp, "spliced")),
				unspliced = t(assay(sce_temp, "unspliced"))
			)
		)
		ad$write_h5ad(paste0("kidney_mouse/03_data/null/BRIE2/cell_info_",
												 cl, ".h5ad"))
		write.table(data.frame(index = colnames(sce_temp), 
													 is_A = ifelse(sce_temp$group == "A", 1, 0)),
								file = paste0("kidney_mouse/03_data/null/BRIE2/cell_info_", 
															cl, ".tsv"),
								quote = FALSE,
								sep = "\t", row.names = FALSE)
	}
	#system("bash code/05_null_analysis/DA_brie.sh")
	end <- Sys.time()
	
	return (end - start)
})
saveRDS(dexseq_time, "kidney_mouse/03_data/brie_bench.rds")
