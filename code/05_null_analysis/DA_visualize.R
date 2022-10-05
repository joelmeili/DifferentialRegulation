# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(ggplot2)
})

# load data
results_eisar <- readRDS("kidney_mouse/03_data/eisar_res_null.rds")
results_dexseq_US <- readRDS("kidney_mouse/03_data/dexseq_res_US_null.rds")

# GROUPS
GROUPS <- c("AABB",
						"ABAB",
						"ABBA")

for (i in 1:length(GROUPS)) {
	results_eisar[[i]]$Group <- GROUPS[[i]]
	results_dexseq_US[[i]]$Group <- GROUPS[[i]]
}

results_eisar <- do.call("rbind", results_eisar)
results_eisar$Method <- "eisaR"
results_eisar$P_value <- results_eisar$p_eisaR
results_eisar$P_value_adj <- results_eisar$p_eisaR_adj
results_eisar <- results_eisar[, c("Gene_id", "Cell_type", "Method", "Group", "P_value", "P_value_adj")]

results_dexseq_US <- do.call("rbind", results_dexseq_US)
results_dexseq_US$Method <- "DEXSeq"
results_dexseq_US$P_value <- results_dexseq_US$p_DEXSeq
results_dexseq_US$P_value_adj <- results_dexseq_US$p_DEXSeq_adj
results_dexseq_US <- results_dexseq_US[, c("Gene_id", "Cell_type", "Method", "Group", "P_value", "P_value_adj")]

results <- rbind(results_eisar, results_dexseq_US)

# plot p-value distributions across groups
g1 <- ggplot(results, aes(x = P_value, fill = Method)) + facet_grid(~ Group) +
	geom_histogram(aes(y = ..density..), alpha = 0.4) + theme_classic() +
	geom_line(aes(y = ..density.., colour = Method), stat = "density") +
	xlab("P-value") + ylab("Density") + ggtitle("P-value distribution based on group separation")
ggsave(g1, filename = "figures/null_analysis/p_value_distribution.png", height = 4, width = 6, scale = 1.5)

