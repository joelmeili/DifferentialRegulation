# load libraries
suppressPackageStartupMessages({
	library(iCOBRA)
	library(ggplot2)
})

# plot performance
plot_performance <- function (COBRA_DF, SAVE_FILE_PATH) {
	
	perf <- calculate_performance(DF_COBRA, binary_truth = "status")
	cobra_plot <- prepare_data_for_plot(perf, facetted = TRUE)
	
	# plot ROC curve
	plot_roc(cobra_plot) +
		ggsave(filename = paste0(SAVE_FILE_PATH, "_ROC.pdf"))
	
	# plot FDR/TPR curve
	plot_fdrtprcurve(cobra_plot) +
		ggsave(filename = paste0(SAVE_FILE_PATH, "_fdr_tpr.pdf"))
}