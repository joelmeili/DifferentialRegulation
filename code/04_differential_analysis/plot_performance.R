# load libraries
suppressPackageStartupMessages({
	library(iCOBRA)
	library(ggplot2)
	library(gridExtra)
})

# read results BRIE2
read_results_brie <- function (CLUSTERS, DGE) {
	RESULTS <- lapply(CLUSTERS, function (CLUSTER) {
		if (CLUSTER == "Epithelial cells") {CLUSTER_PATH <- "Epithelial_cells"} else {CLUSTER_PATH <- CLUSTER}
		if (DGE) {
			res <- read.table(file = paste0("kidney_mouse/03_data/BRIE2/simulation_DGE/isA_", CLUSTER_PATH, ".brie_ident.tsv"), sep = "\t", header = TRUE)
		} else {
			res <- read.table(file = paste0("kidney_mouse/03_data/BRIE2/simulation/isA_", CLUSTER_PATH, ".brie_ident.tsv"), sep = "\t", header = TRUE)
		}

		res$Cell_type <- CLUSTER
		colnames(res)[1] <- "Gene_id"

		return (res)
	})
	return (do.call("rbind", RESULTS))
}

# plot performance
plot_performance <- function (COBRA_DF, SAVE_FILE_PATH) {
	
	perf <- calculate_performance(DF_COBRA, binary_truth = "status")
	cobra_plot <- prepare_data_for_plot(perf, facetted = FALSE)
	
	# plot ROC curve
	roc <- plot_roc(cobra_plot, title = "ROC curve") +
		guides(colour = guide_legend(title = "Method"))  +
		scale_color_manual(values = c("#F8766D", "#00BA38", "#619CFF"), labels = c("BRIE2", "DEXSeq", "eisaR"))
	
	# plot TPR/FDR curve
	fdr <- plot_fdrtprcurve(cobra_plot, title = "TPR-FDR plot") +
		guides(colour = guide_legend(title = "Method")) +
		scale_color_manual(values = c("#F8766D", "#00BA38", "#619CFF"), labels = c("BRIE2", "DEXSeq", "eisaR"))
		
	# save plots
	grob <- arrangeGrob(roc, fdr, nrow = 2)
	ggsave(grob, file = paste0(SAVE_FILE_PATH, "_performance.png"), height = 8, width = 6)
}