# clean environment
rm(list = ls())

# load libraries
suppressPackageStartupMessages({
	library(velocyto.R)
})

# load single cell experiment
sce <- readRDS("kidney_mouse/03_data/mouse_data_fry_USA.rds")

# run velocity estimation
emat <- assay(sce, "spliced")
nmat <- assay(sce, "unspliced")

cell_types <- sce$cell_type
# get umap embedding