# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(ggplot2)
	library(xtable)
})

# load data
DF_merged <- readRDS("kidney_mouse/03_data/DA_null.rds")
load("kidney_mouse/03_data/DA_null_eisar.RData")
load("kidney_mouse/03_data/DA_null_diff_reg.RData")
load("kidney_mouse/03_data/DA_null_dexseq.RData")

colnames(DF_merged) <- c("Gene_id", "Cell_type", "Group",
												"eisaR", "eisaR_FDR",
												"BRIE2", "BRIE2_FDR")

DF_merged$Gene_id <- substr(DF_merged$Gene_id, 1, 18)

DF_merged$eisaR <- NULL
DF_merged$eisaR_FDR <- NULL

#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
# eisaR:
#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
for(gr in 1:3){
	DF_eisaR_list[[gr]]$Group <-gr
}
DF_eisaR_unlist <- do.call(rbind, DF_eisaR_list)

colnames(DF_eisaR_unlist) = c("Gene_id", "Cell_type", "eisaR", "eisaR_FDR", "Group")

DF_eisaR_unlist$Gene_id <- substr(DF_eisaR_unlist$Gene_id, 1, 18)

DF_merged <- merge(DF_merged, DF_eisaR_unlist, by = c("Gene_id", "Cell_type", "Group"))

#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
# DEXSeq USA sce:
#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
# load DEXSeq USA results:
for(gr in 1:3){
	DF_DEXSeq[[gr]]$replicate <- gr
}
DF_DEXSeq_unlist <- do.call(rbind, DF_DEXSeq)

DF_DEXSeq_unlist$DEXSeq <- DF_DEXSeq_unlist$qval
DF_DEXSeq_unlist$DEXSeq_FDR <- DF_DEXSeq_unlist$qval
colnames(DF_DEXSeq_unlist) <- c("qval", "Gene_id", "Cell_type", "Group", "DEXSeq", "DEXSeq_FDR")

DF_merged <- merge(DF_merged, DF_DEXSeq_unlist, by = c("Gene_id", "Cell_type", "Group"))

#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
# DifferentialRegulation
#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
results_EC <- lapply(results_EC, function(X) X[[1]])

for(gr in 1:3){
	results_EC[[gr]]$Group <- gr
}
results_EC <- do.call(rbind, results_EC)

colnames(results_EC)[c(1:3, 5)] <- c("Gene_id", "Cell_type", "DifferentialRegulation", "DifferentialRegulation_FDR")

results_EC$Gene_id <- substr(results_EC$Gene_id, 1, 18)

DF_merged <- merge(DF_merged, results_EC, by = c("Gene_id", "Cell_type", "Group"))

#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
# create dataframe:
#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
methods = c("BRIE2", "eisaR", "DEXSeq", "DifferentialRegulation")

DF <- list()
for(m in 1:length(methods)){
	sel <- which(names(DF_merged) == methods[m])
	sel_FDR <- which(names(DF_merged) == paste0(methods[m], "_FDR"))
	
	DF[[m]] <- data.frame(Group = DF_merged$Group,
											 p_val = DF_merged[, sel],
											 FDR = DF_merged[, sel_FDR],
											 Method = methods[m])
}
DF <- do.call(rbind, DF)
DF$Group <- factor(DF$Group)

# plot p-value distributions across groups
g1 <- ggplot(data = DF[DF$Method != "DEXSeq", ], aes(x = p_val, 
																col = Method, fill = Method, lty = Group)) +
	geom_density(adjust = 1, size = 0.3, alpha = 0.1) + 
	scale_alpha_manual(values = c("TRUE" = 0.1, "FALSE" = 0.4)) +
	guides(col = FALSE,
				 lty = guide_legend(ncol = 1, order = 2),
				 fill = guide_legend(ncol = 1, order = 1,
				 										override.aes = list(alpha = 1, col = NA))) +
	scale_x_continuous("P-value", breaks = seq(0, 1, 0.2), expand = c(0, 0.05)) +
	scale_y_continuous("Density", breaks = c(0, 1), expand = c(0, 0.1)) +
	facet_grid(~ Method) + theme(legend.position = "bottom") + theme_classic() +
	ggtitle("P-value distribution of the Null analysis based on group separation and method") +
	theme(legend.position = "bottom") + geom_hline(yintercept = 1, linetype = "dashed", col = 1) +
	scale_color_manual(values = c("#F8766D", "#00BFC4", "#00BA38"), labels = c("BRIE2", "DifferentialRegulation", "eisaR")) +
	scale_fill_manual(values = c("#F8766D", "#00BFC4", "#00BA38"), labels = c("BRIE2", "DifferentialRegulation", "eisaR"))

ggsave(g1, filename = "figures/null_analysis/p_value_distribution.png", height = 4, width = 6, scale = 1.5)

# FPs in p-vals and in FDR
FP <- t(sapply( split(DF$p_val, DF$Method), function(x){
	c(mean(x< 0.1), mean(x< 0.05), mean(x< 0.01) )
}))
FP <- FP[-2,]

FDR <- t(sapply( split(DF$FDR, DF$Method), function(x){
	c(mean(x< 0.1), mean(x< 0.05), mean(x< 0.01) )
}))
colnames(FDR) <- colnames(FP) <-  c("10%", "5%", "1%")

xtable(FP, digits = 3)
xtable(FDR, digits = 3)