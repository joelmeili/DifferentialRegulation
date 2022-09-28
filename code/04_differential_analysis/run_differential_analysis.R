# load packages
suppressPackageStartupMessages({
  library(SummarizedExperiment)
  library(foreach)
})

# import differential analysis methods
source("code/04_differential_analysis/differential_analysis.R")

# run eisaR on the US data
run_analysis_eisar <- function (sce, GROUP, CLUSTERS, min_count) {
  sce$group <- ifelse(sce$sample_id %in% which(GROUP == "A"), "A", "B")
  
  RESULTS_EISAR <- foreach(i = 1:length(CLUSTERS),
                           .combine = "rbind",
                           .packages = c("muscat", "eisaR",
                                         "SummarizedExperiment"),
                           .export = c("run_eisar", "prepare_bulk")) %dopar% {
                             
                             # select sce
                             temp <- sce[, sce$cell_type == CLUSTERS[[i]]]
                             
                             # remove lowly expressed genes: at least 10 non-zero cells:
                             filter <- (rowSums(assays(temp)$TOT_counts[, temp$group == "A"] > 0) >= min_count) &
                               (rowSums(assays(temp)$TOT_counts[, temp$group == "B"] > 0) >= min_count)
                             temp <- temp[filter, ]
                             
                             # run eisaR
                             RES <- run_eisar(sce = temp, GROUP = GROUP)
                             RES$Cell_type <- CLUSTERS[[i]]
                             
                             return (RES)
                           }
  return (RESULTS_EISAR)
}

# run DEXSeq on the USA data
run_analysis_dexseq <- function (sce, GROUP, CLUSTERS, min_count) {
	sce$group <- ifelse(sce$sample_id %in% which(GROUP == "A"), "A", "B")
	
	RESULTS_DEXSEQ <- foreach(i = 1:length(CLUSTERS),
														.combine = "rbind",
														.packages = c("muscat", "DEXSeq",
																					"SummarizedExperiment"),
														.export = c("run_dexseq", "prepare_bulk")) %dopar% {
															
															# select sce
															temp <- sce[, sce$cell_type == CLUSTERS[[i]]]
															
															# remove lowly expressed genes: at least 10 non-zero cells:
															filter <- (rowSums(assays(temp)$TOT_counts[, temp$group == "A"] > 0) >= min_count) &
																(rowSums(assays(temp)$TOT_counts[, temp$group == "B"] > 0) >= min_count)
															temp <- temp[filter, ]
															
															# run eisaR
															RES <- run_dexseq(sce = temp, GROUP = GROUP)
															RES$Cell_type <- CLUSTERS[[i]]
															
															return (RES)
														}
	}