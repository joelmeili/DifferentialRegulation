# load libraries
suppressPackageStartupMessages({
	library(iCOBRA)
	library(ggplot2)
})

# read results BRIE2
read_results_brie <- function (CLUSTERS) {
	RESULTS <- lapply(CLUSTERS, function (CLUSTER) {
		res <- read.table(file = paste0("kidney_mouse/03_data/BRIE2/simulation/isA_", CLUSTER, ".brie_ident.tsv"), sep = "\t", header = TRUE)
		res$Cell_type <- CLUSTER
		colnames(res)[1] <- "Gene_id"
		return (res)
	})
	
	return (do.call("rbind", RESULTS))
}

# plot performance
plot_performance <- function (COBRA_DF, SAVE_FILE_PATH) {
	
	perf <- calculate_performance(DF_COBRA, binary_truth = "status")
	cobra_plot <- prepare_data_for_plot(perf, facetted = TRUE)
	
	# plot ROC curve
	roc <- plot_roc(cobra_plot) + ggtitle("ROC curve")
	ggsave(roc, filename = paste0(SAVE_FILE_PATH, "_ROC.pdf"))
	
	# plot FDR/TPR curve
	fdr <- plot_fdrtprcurve(cobra_plot) + ggtitle("TPR-FPR plot")
	ggsave(fdr, filename = paste0(SAVE_FILE_PATH, "_fdr_tpr.pdf"))}