# clean environment
rm(list = ls())

# load libraries
suppressPackageStartupMessages({
  library(scater)
  library(gridExtra)
	library(kableExtra)
	library(tidyverse)
	library(alevinQC)
})

# load single cell experiment after QC filtering
sce <- readRDS("kidney_mouse/03_data/mouse_data_fry_USA.rds")
sce$sample_id <- paste0("normal", sce$sample_id)

# show cell distributions across samples
eda <- data.frame(sample_id = sce$sample_id, cell_type = sce$cell_type)
cell_type_eda <- eda %>% mutate(cell_type = case_when(!(cell_type %in% c("Adipocytes", "Epithelial cells", "Hepatocytes")) ~ "other", 
																											TRUE ~ cell_type))
g1 <- ggplot(eda, aes(x = cell_type)) + geom_bar() + xlab("Cell type") + ylab("Number of cells") + theme_classic() +
	theme(axis.text.x = element_text(angle = 45, hjust = 1)) + stat_count(geom = "text", colour = "white", size = 2.5,
																																			aes(label = ..count..), position = position_stack(vjust = 0.5))
g2 <- ggplot(cell_type_eda, aes(x = cell_type)) + geom_bar() + xlab("Cell type") + ylab("Number of cells") + 
	facet_grid(~ sample_id) + theme_classic() + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
	stat_count(geom = "text", colour = "white", size = 2.5, aes(label = ..count..), position = position_stack(vjust = 0.5))

grob1 <- arrangeGrob(g1, g2, nrow = 2)
ggsave(grob1, file = "figures/kidney_mouse/cell_type_distribution.png", height = 5, width = 6)

# plot UMAP by sample id and cell type
g3 <- plotReducedDim(sce, dimred = "UMAP",
										 colour_by = "sample_id") +
	theme_classic() +
	guides(colour = guide_legend(title = "Sample"
	))

g4 <- plotReducedDim(sce, dimred = "UMAP",
										 colour_by = "cell_type") +
	theme_classic() +
	guides(colour = guide_legend(title = "Cell type"
	)) + theme(legend.key.size = unit(0.2, "cm"))

ggsave(g3, filename = "figures/kidney_mouse/UMAP_mouse_sample_id.png",
			 device = "png",
			 width = 6,
			 height = 4,
			 units = "in",
			 dpi = 300,
			 limitsize = TRUE)

ggsave(g4, filename = "figures/kidney_mouse/UMAP_mouse_cell_type.png",
			 device = "png",
			 width = 6,
			 height = 4,
			 units = "in",
			 dpi = 300,
			 limitsize = TRUE)