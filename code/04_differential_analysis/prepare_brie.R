# load libraries
suppressPackageStartupMessages({
	library(anndata)
})

# prepare data for BRIE2
prepare_brie <- function (sce, DGE, CLUSTERS, GROUP) {
	for (i in 1:length(CLUSTERS)) {
		# filter based on cell type
		sce_temp <- sce[, sce$cell_type == CLUSTERS[[i]]]
		
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
		
		if (DGE) {
			ad$write_h5ad(paste0("kidney_mouse/03_data/BRIE2/simulation/cell_info_",
													 cl, ".h5ad"))
			write.table(data.frame(index = colnames(sce_temp), 
														 is_A = ifelse(sce_temp$group == "A", 1, 0)),
									file = paste0("kidney_mouse/03_data/BRIE2/simulation/cell_info_", 
																cl, ".tsv"),
									quote = FALSE,
									sep = "\t", row.names = FALSE)
		} else {
			ad$write_h5ad(paste0("kidney_mouse/03_data/BRIE2/simulation_DGE/cell_info_",
													 cl, ".h5ad"))
			write.table(data.frame(index = colnames(sce_temp), 
														 is_A = ifelse(sce_temp$group == "A", 1, 0)),
									file = paste0("kidney_mouse/03_data/BRIE2/simulation_DGE/cell_info_", 
																cl, ".tsv"),
									quote = FALSE,
									sep = "\t", row.names = FALSE)
		}
	}
}
