suppressPackageStartupMessages({
  library(scater)
  library(gridExtra)
})

# load unfiltered sce
sce <- readRDS("kidney_mouse/03_data/mouse_data_fry_USA_no_QC.rds")

# calculate per-cell quality control (QC) metrics
qc <- perCellQCMetrics(sce)

# remove cells with few or many detected genes
ol <- isOutlier(metric = qc$detected, nmads = 2, log = TRUE)
qc <- cbind(qc, ol)

colData(sce) <- cbind(colData(sce), qc)
sce$sample_id <- factor(sce$sample_id)

# remove undetected genes
sce_filtered <- sce[rowSums(assays(sce)$TOT_counts > 0) > 0, ]

# remove lowly expressed genes: at least 10 non-zero cells:
sce_filtered <- sce_filtered[rowSums(assays(sce_filtered)$TOT_counts > 0) >= 10, ]
sce_filtered <- sce_filtered[, !ol]

# diagnostic plot comparing counts before and after QC 
g1 <- plotColData(sce, x = "sample_id", y = "sum", colour_by = "ol") + scale_y_log10() +
  guides(colour = guide_legend(title = "Outlier")) + xlab("Sample id")
g2 <- plotColData(sce_filtered, x = "sample_id", y = "sum") + scale_y_log10() + xlab("Sample id")

g <- arrangeGrob(g1, g2, nrow = 2)
ggsave(g, file = "kidney_mouse/04_figures/qc_mouse.png", height = 4, width = 6)
