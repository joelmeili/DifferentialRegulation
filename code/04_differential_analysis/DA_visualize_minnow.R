# clean environment
rm(list = ls())

# load libraries
suppressPackageStartupMessages({
	library(ggplot2)
})

# load data
sce <- readRDS("kidney_mouse/03_data/mouse_simulation.rds")
sce_DGE <- readRDS("kidney_mouse/03_data/mouse_simulation_DGE.rds")
truth <- metadata(sce)$truth
truth_DGE <- metadata(sce_DGE)$truth

brie <- readRDS("kidney_mouse/03_data/DA_minnow_brie2.rds")
brie_DGE<- readRDS("kidney_mouse/03_data/DA_minnow_brie2.rds")

load("kidney_mouse/03_data/DA_minnow_eisar_DGE.RData")
DF_eisar_DGE <- DF_eisaR
load("kidney_mouse/03_data/DA_minnow_eisar.RData")
DF_eisar <- DF_eisaR

load("kidney_mouse/03_data/DA_minnow_dexseq_DGE.RData")
DF_dexseq_DGE <- DF_DEXSeq

load("kidney_mouse/03_data/DA_minnow_dexseq.RData")
DF_dexseq <- DF_DEXSeq

load("kidney_mouse/03_data/DA_minnow_diff_reg_DGE.RData")
results_EC_DGE <- results_EC
results_USA_DGE <- results_USA
load("kidney_mouse/03_data/DA_minnow_diff_reg.RData")

# 
CLUSTERS <- c("Adipocytes", "Epithelial cells", "Hepatocytes")

colnames(DF_eisar) <- c("Gene_id", "Cell_type", "p_value", "FDR")
colnames(DF_eisar_DGE) <- c("Gene_id", "Cell_type",  "p_value", "FDR")
colnames(DF_dexseq) <- c("FDR", "Gene_id", "Cell_type")
colnames(DF_DEXSeq_DGE) <- c("FDR", "Gene_id", "Cell_type")






