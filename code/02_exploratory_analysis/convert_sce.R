# clean environment
rm(list = ls())

# load packages
suppressPackageStartupMessages({
  library(zellkonverter)
})

# load sce
sce <- readRDS("kidney_mouse/03_data/mouse_data_fry_USA.rds")

# load abundances
sample_ids <- 1:4

# convert sce to anndata format for RNA velocity
for (i in sample_ids) {
	# select individual sample:
	temp <- sce[, sce$sample_id == i]
	
	# create AnnData object:
	ad <- SCE2AnnData(
		temp,
		X_name = "spliced",
		assays = c("spliced", "unspliced"),
		colData = TRUE,
		rowData = TRUE,
		varm = TRUE,
		reducedDims = TRUE,
		metadata = TRUE,
		colPairs = TRUE,
		rowPairs = TRUE,
		skip_assays = FALSE,
		verbose = TRUE
	)
	ad$write_h5ad(filename = paste0("kidney_mouse/03_data/adata_normal", i, ".h5ad"))
}