# clean environment
rm(list = ls())

# load libraries
suppressPackageStartupMessages({
	library(ggplot2)
	library(iCOBRA)
})

# load data
DF_brie <- readRDS("kidney_mouse/03_data/DA_minnow_brie.rds")
DF_brie_DGE<- readRDS("kidney_mouse/03_data/DA_minnow_brie_DGE.rds")
colnames(DF_brie) <- c("Gene_id", "p_value_brie", "FDR_brie", "Cell_type")
colnames(DF_brie_DGE) <- c("Gene_id", "Cell_type", "p_value_brie", "FDR_brie", "truth", "truth_DGE", "FC")
DF_brie_DGE$truth <- ifelse(DF_brie_DGE$truth | DF_brie_DGE$truth_DGE, 1, 0)

DF_truth <- merge(DF_brie, DF_brie_DGE)
DF_truth <- DF_truth[, c("Gene_id", "Cell_type", "truth")]

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

# preparing data for merging
CLUSTERS <- c("Adipocytes", "Epithelial cells", "Hepatocytes")

colnames(DF_eisar) <- c("Gene_id", "Cell_type", "p_value_eisar", "FDR_eisar")
colnames(DF_eisar_DGE) <- c("Gene_id", "Cell_type",  "p_value_eisar", "FDR_eisar")
colnames(DF_dexseq) <- c("FDR_dexseq", "Gene_id", "Cell_type")
colnames(DF_dexseq_DGE) <- c("FDR_dexseq", "Gene_id", "Cell_type")

results_EC <- lapply(results_EC, function(x) x[[1]])
results_EC_DGE <- lapply(results_EC_DGE, function(x) x[[1]])
DF_diff_reg <- do.call("rbind", results_EC)
DF_diff_reg_DGE <- do.call("rbind", results_EC_DGE)
DF_diff_reg$p_adj.glb <- NULL
DF_diff_reg$p_adj.glb <- NULL
colnames(DF_diff_reg) <- colnames(DF_diff_reg_DGE) <- c("Gene_id", "Cell_type", "p_value_DR", "FDR_DR")

# merge results
DF_merged <- merge(DF_eisar, DF_brie, by = c("Gene_id", "Cell_type"))
DF_merged <- merge(DF_merged, DF_dexseq, by = c("Gene_id", "Cell_type"))
DF_merged <- merge(DF_merged, DF_diff_reg, by = c("Gene_id", "Cell_type"))
DF_merged <- merge(DF_merged, DF_truth, by = c("Gene_id", "Cell_type"))

DF_merged_DGE <- merge(DF_eisar_DGE, DF_brie_DGE, by = c("Gene_id", "Cell_type"))
DF_merged_DGE <- merge(DF_merged_DGE, DF_dexseq_DGE, by = c("Gene_id", "Cell_type"))
DF_merged_DGE <- merge(DF_merged_DGE, DF_diff_reg_DGE, by = c("Gene_id", "Cell_type"))

# visualize performance
DF_COBRA <- COBRAData(
	pval = data.frame(
		BRIE2 = DF_merged$p_value_brie,
		eisaR = DF_merged$p_value_eisar,
		DR = DF_merged$p_value_DR
		),
		padj = data.frame(
		BRIE2 = DF_merged$FDR_brie,
		eisaR = DF_merged$FDR_eisar,
		DR = DF_merged$FDR_DR),
		truth = data.frame(status = DF_merged$truth)
)

DF_COBRA_DGE <- COBRAData(
	pval = data.frame(
		BRIE2 = DF_merged_DGE$p_value_brie,
		eisaR = DF_merged_DGE$p_value_eisar,
		DR = DF_merged_DGE$p_value_DR
	),
	padj = data.frame(
		BRIE2 = DF_merged_DGE$FDR_brie,
		eisaR = DF_merged_DGE$FDR_eisar,
		DR = DF_merged_DGE$FDR_DR),
	truth = data.frame(status = DF_merged_DGE$truth)
)

perf <- calculate_performance(DF_COBRA, binary_truth = "status")
perf_DGE <- calculate_performance(DF_COBRA_DGE, binary_truth = "status")
cobra_plot <- prepare_data_for_plot(perf, facetted = FALSE)
cobra_plot_DGE <- prepare_data_for_plot(perf_DGE, facetted = FALSE)

# save file path
SAVE_FILE_PATH <- "figures/simulation/minnow_simulation"

# plot ROC curve
roc <- plot_roc(cobra_plot, title = "ROC curve") +
	guides(colour = guide_legend(title = "Method"))  +
	scale_color_manual(values = c("#F8766D", "#00BA38", "#00BFC4"), labels = c("BRIE2", "DR", "eisaR")) +
	theme_classic() + theme(legend.position = "bottom")

roc_DGE <- plot_roc(cobra_plot_DGE, title = "ROC curve") +
	guides(colour = guide_legend(title = "Method"))  +
	scale_color_manual(values = c("#F8766D", "#00BA38", "#00BFC4"), labels = c("BRIE2", "DR", "eisaR")) +
	theme_classic() + theme(legend.position = "bottom")

ggsave(paste0(SAVE_FILE_PATH, "_ROC.png"), roc, height = 4, width = 6)
ggsave(paste0(SAVE_FILE_PATH, "_DGE_ROC.png"), roc_DGE, height = 4, width = 6)

# plot TPR/FDR curve
fdr <- plot_fdrtprcurve(cobra_plot, title = "TPR-FDR plot") +
	guides(colour = guide_legend(title = "Method")) +
	scale_color_manual(values = c("#F8766D", "#00BA38", "#00BFC4"), labels = c("BRIE2", "DR", "eisaR")) +
	theme_classic() + theme(legend.position = "bottom")

fdr_DGE <- plot_fdrtprcurve(cobra_plot_DGE, title = "TPR-FDR plot") +
	guides(colour = guide_legend(title = "Method")) +
	scale_color_manual(values = c("#F8766D", "#00BA38", "#00BFC4"), labels = c("BRIE2", "DR", "eisaR")) +
	theme_classic() + theme(legend.position = "bottom")

ggsave(paste0(SAVE_FILE_PATH, "_FDR.png"), fdr, height = 4, width = 6)
ggsave(paste0(SAVE_FILE_PATH, "_DGE_FDR.png"), fdr_DGE, height = 4, width = 6)