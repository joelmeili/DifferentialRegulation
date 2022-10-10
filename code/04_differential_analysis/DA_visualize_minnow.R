# clean environment
rm(list = ls())

# load libraries
suppressPackageStartupMessages({
	library(ggplot2)
	library(iCOBRA)
})

# load data
create_DF <- function (DGE) {
	# define CLUSTERS to be analyzed
	CLUSTERS <- c("Adipocytes", "Epithelial cells", "Hepatocytes")
	
	if (DGE) {
		sce <- readRDS("kidney_mouse/03_data/minnow_simulation_DGE.rds")
	} else {
		sce <- readRDS("kidney_mouse/03_data/minnow_simulation.rds")
	}
	truth <- metadata(sce)$truth
	DF <- list()
	for(cl in 1:length(CLUSTERS)){
		sel_cl <- sce$cell_type == CLUSTERS[cl]
		sim_one_cl = sce[, sel_cl]
		
		sel_A <- sim_one_cl$group == "A"
		tot_counts_A <- rowSums(assays(sim_one_cl)$TOT_counts[, sel_A])
		tot_counts_B <- rowSums(assays(sim_one_cl)$TOT_counts[, !sel_A])
		
		tot_S_A <- rowSums(assays(sim_one_cl)$spliced[, sel_A])
		tot_S_B <- rowSums(assays(sim_one_cl)$spliced[, !sel_A])
		
		DF[[cl]] = data.frame(Gene_id = rownames(sim_one_cl),
													Cell_type = CLUSTERS[cl],
													tot_counts_A = tot_counts_A,
													tot_counts_B = tot_counts_B,
													pi_S_A = tot_S_A/tot_counts_A,
													pi_S_B = tot_S_B/tot_counts_B)
	}
	DF <- do.call(rbind, DF)
	
	DF_merged <- merge(DF, truth, by = c("Gene_id", "Cell_type"))
	
	# remove very small differences (not detectable)
	sel_counts <- (DF_merged$tot_counts_A >= 20) &  (DF_merged$tot_counts_B >= 20)
	DF_merged = DF_merged[sel_counts, ]
	difference <- abs(DF_merged$pi_S_A - DF_merged$pi_S_B)
	sel_difference <- difference < 0.2
	sel_DR <- DF_merged$truth == 1
	DF_merged <- DF_merged[!(sel_DR & sel_difference) , ]
	
	# load results
	if (DGE) {
		DF_brie <- readRDS("kidney_mouse/03_data/DA_minnow_brie_DGE.rds")
	} else {
		DF_brie <- readRDS("kidney_mouse/03_data/DA_minnow_brie.rds")
	}
	DF_brie <- DF_brie[, 1:4]
	
	if (DGE) {
		load("kidney_mouse/03_data/DA_minnow_eisar_DGE.RData")
	} else {
		load("kidney_mouse/03_data/DA_minnow_eisar.RData")
	}
	DF_eisar <- DF_eisaR
	
	if (DGE) {
		load("kidney_mouse/03_data/DA_minnow_dexseq_DGE.RData")
	} else {
		load("kidney_mouse/03_data/DA_minnow_dexseq.RData")
	}
	DF_dexseq <- DF_DEXSeq
	
	if (DGE) {
		load("kidney_mouse/03_data/DA_minnow_diff_reg_DGE.RData")
	} else {
		load("kidney_mouse/03_data/DA_minnow_diff_reg.RData")
	}
	
	colnames(DF_eisar) <- c("Gene_id", "Cell_type", "p_value_eisar", "FDR_eisar")
	colnames(DF_dexseq) <- c("FDR_dexseq", "Gene_id", "Cell_type")
	
	results_EC <- lapply(results_EC, function(x) x[[1]])
	DF_diff_reg <- do.call("rbind", results_EC)
	DF_diff_reg$p_adj.glb <- NULL
	DF_diff_reg$p_adj.glb <- NULL
	colnames(DF_diff_reg) <- c("Gene_id", "Cell_type", "p_value_DR", "FDR_DR")
	
	DF_merged <- merge(DF_merged, DF_brie, by = c("Gene_id", "Cell_type"))
	DF_merged <- merge(DF_merged, DF_eisar, by = c("Gene_id", "Cell_type"))
	DF_merged <- merge(DF_merged, DF_dexseq, by = c("Gene_id", "Cell_type"))
	DF_merged <- merge(DF_merged, DF_diff_reg, by = c("Gene_id", "Cell_type"))
	
	return (DF_merged)
}

DF_merged <- create_DF(DGE = FALSE)
DF_merged_DGE <- create_DF(DGE = TRUE)

# visualize performance
DF_COBRA <- COBRAData(
	pval = data.frame(
		BRIE2 = DF_merged$p_BRIE2,
		eisaR = DF_merged$p_value_eisar,
		DR = DF_merged$p_value_DR
		),
		padj = data.frame(
		BRIE2 = DF_merged$p_BRIE2_adj,
		DEXSeq = DF_merged$FDR_dexseq,
		eisaR = DF_merged$FDR_eisar,
		DR = DF_merged$FDR_DR),
		truth = data.frame(status = DF_merged$truth)
)

DF_COBRA_DGE <- COBRAData(
	pval = data.frame(
		BRIE2 = DF_merged_DGE$p_BRIE2,
		eisaR = DF_merged_DGE$p_value_eisar,
		DR = DF_merged_DGE$p_value_DR
	),
	padj = data.frame(
		BRIE2 = DF_merged_DGE$p_BRIE2_adj,
		DEXSeq = DF_merged_DGE$FDR_dexseq,
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
	scale_color_manual(values = c("#F8766D", "#00BA38", "#00BFC4", "#C77CFF"), labels = c("BRIE2", "DEXSeq", "DR", "eisaR")) +
	theme_classic() + theme(legend.position = "bottom")

roc_DGE <- plot_roc(cobra_plot_DGE, title = "ROC curve") +
	guides(colour = guide_legend(title = "Method"))  +
	scale_color_manual(values = c("#F8766D", "#00BA38", "#00BFC4", "#C77CFF"), labels = c("BRIE2", "DEXSeq", "DR", "eisaR")) +
	theme_classic() + theme(legend.position = "bottom")

ggsave(paste0(SAVE_FILE_PATH, "_ROC.png"), roc, height = 4, width = 6)
ggsave(paste0(SAVE_FILE_PATH, "_DGE_ROC.png"), roc_DGE, height = 4, width = 6)

# plot TPR/FDR curve
fdr <- plot_fdrtprcurve(cobra_plot, title = "TPR-FDR plot") +
	guides(colour = guide_legend(title = "Method")) +
	scale_color_manual(values = c("#F8766D", "#00BA38", "#00BFC4", "#C77CFF"), labels = c("BRIE2", "DEXSeq", "DR", "eisaR")) +
	theme_classic() + theme(legend.position = "bottom")

fdr_DGE <- plot_fdrtprcurve(cobra_plot_DGE, title = "TPR-FDR plot") +
	guides(colour = guide_legend(title = "Method")) +
	scale_color_manual(values = c("#F8766D", "#00BA38", "#00BFC4", "#C77CFF"), labels = c("BRIE2", "DEXSeq", "DR", "eisaR")) +
	theme_classic() + theme(legend.position = "bottom")

ggsave(paste0(SAVE_FILE_PATH, "_FDR.png"), fdr, height = 4, width = 6)
ggsave(paste0(SAVE_FILE_PATH, "_DGE_FDR.png"), fdr_DGE, height = 4, width = 6)