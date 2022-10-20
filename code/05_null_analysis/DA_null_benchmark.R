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

GROUPS <- list(c("A", "A", "B", "B"),
							c("A", "B", "A", "B"),
							c("A", "B", "B", "A"))

CLUSTERS <- c("Adipocytes", "Epithelial cells", "Hepatocytes")

sce_US <- convert_USA_to_US(sce_USA)

# define parallel
cl <- makeCluster(3)
registerDoParallel(cl, cores = 3)

# # run eisaR on the US count data
# eisar_time <- lapply(GROUPS, function (GROUP) {
# 	start <- Sys.time()
# 	run_analysis_eisar(sce = sce_US, GROUP = GROUP, CLUSTERS = CLUSTERS, min_count = min_count)
# 	end <- Sys.time()
# 	return (as.numeric(end - start, units = "secs"))
# })
# saveRDS(eisar_time, "kidney_mouse/03_data/eisar_bench.rds")
# 
# # run DEXSeq on the USA count data
# dexseq_time <- lapply(GROUPS, function (GROUP) {
# 	start <- Sys.time()
# 	run_analysis_dexseq(sce = sce_USA, GROUP = GROUP, CLUSTERS = CLUSTERS, min_count = min_count, method = "USA")
# 	end <- Sys.time()
# 	return (as.numeric(end - start, units = "secs"))
# })
# saveRDS(dexseq_time, "kidney_mouse/03_data/dexseq_bench.rds")
# 
# # run BRIE2 on the US count data
# brie_time <- lapply(GROUPS, function (GROUP) {
# 	start <- Sys.time()
# 	for (i in 1:length(CLUSTERS)) {
# 		# filter based on cell type
# 		sce_temp <- sce_US[, sce_US$cell_type == CLUSTERS[[i]]]
# 
# 		cl <- sapply(strsplit(CLUSTERS[[i]], " "), function (x) paste0(x, collapse = "_"))
# 
# 		# set group attribute
# 		sce_temp$group <- ifelse(sce_temp$sample_id %in% which(GROUP == "A"), "A", "B")
# 
# 		# remove lowly expressed genes: at least 10 non-zero cells:
# 		filter <- (rowSums(assays(sce_temp)$TOT_counts[, sce_temp$group == "A"] > 0) >= min_count) &
# 			(rowSums(assays(sce_temp)$TOT_counts[, sce_temp$group == "B"] > 0) >= min_count)
# 
# 		sce_temp <- sce_temp[filter, ]
# 
# 		ad <- AnnData(
# 			X = t(assay(sce_temp, "spliced")),
# 			layers = list(
# 				spliced = t(assay(sce_temp, "spliced")),
# 				unspliced = t(assay(sce_temp, "unspliced"))
# 			)
# 		)
# 		ad$write_h5ad(paste0("kidney_mouse/03_data/null/BRIE2/cell_info_",
# 												 cl, ".h5ad"))
# 		write.table(data.frame(index = colnames(sce_temp),
# 													 is_A = ifelse(sce_temp$group == "A", 1, 0)),
# 								file = paste0("kidney_mouse/03_data/null/BRIE2/cell_info_",
# 															cl, ".tsv"),
# 								quote = FALSE,
# 								sep = "\t", row.names = FALSE)
# 	}
# 	system("bash code/05_null_analysis/DA_brie.sh")
# 	end <- Sys.time()
# 	return (as.numeric(end - start, units = "secs"))
# })
# saveRDS(brie_time, "kidney_mouse/03_data/brie_bench.rds")

# run DR on the equivalence classes
sample_ids <- paste0("normal", 1:4)
base_dir <- file.path("kidney_mouse/02_data_fry/", sample_ids)
path_to_EC_counts <- file.path(base_dir, "/alevin/geqc_counts.mtx")
path_to_EC <- file.path(base_dir, "/alevin/gene_eqclass.txt.gz")
path_to_cell_id <- file.path(base_dir,"/alevin/quants_mat_rows.txt")
path_to_gene_id <- file.path(base_dir,"/alevin/quants_mat_cols.txt")

EC_list <- load_EC(path_to_EC_counts = path_to_EC_counts,
									 path_to_EC = path_to_EC,
									 path_to_cell_id = path_to_cell_id,
									 path_to_gene_id = path_to_gene_id,
									 sample_ids = sample_ids)


dr_time <- lapply(GROUPS, function (GROUP) {
	start <- Sys.time()
	
	# set temporary SCE
	sce_temp <- sce_USA[, sce_USA$cell_type %in% CLUSTERS]
	colnames(sce_temp) <- paste0("normal", colnames(sce_temp))
	
	# set group attribute
	sce_temp$group <- ifelse(sce_temp$sample_id %in% which(GROUP == "A"), "A", "B")
	
	filter <- (rowSums(assays(sce_temp)$TOT_counts[, sce_temp$group == "A"] > 0) >= min_count) & 
		(rowSums(assays(sce_temp)$TOT_counts[, sce_temp$group == "B"] > 0) >= min_count)
	
	sce_temp <- sce_temp[filter, ]
	sce_temp$sample_id <- as.factor(paste0("normal", sce_temp$sample_id))
	
	# calculate pb counts
	pb_counts <- compute_PB_counts(sce = sce_temp, EC_list = EC_list, 
																 design = data.frame(sample = paste0("normal", 1:4),
																 										group = GROUP))
	# run DR
	DifferentialRegulation(pb_counts, n_cores = 3)
	end <- Sys.time()
	return (as.numeric(end - start, units = "secs"))
})
saveRDS(dr_time, "kidney_mouse/03_data/dr_bench.rds")