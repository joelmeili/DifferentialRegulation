suppressPackageStartupMessages(
  library(scater)
)

# remove undetected genes
sce <- sce[rowSums(assays(sce)$TOT_counts > 0) > 0, ]

# calculate per-cell quality control (QC) metrics
qc <- perCellQCMetrics(sce)

# remove cells with few or many detected genes
ol <- isOutlier(metric = qc$detected, nmads = 2, log = TRUE)
sce <- sce[, !ol]

# remove lowly expressed genes: at least 10 non-zero cells:
sce <- sce[rowSums(assays(sce)$TOT_counts > 0) >= 10, ]



plotColData(sce, x = "block", y = "detected", colour_by = "discard",
            other_fields = "sample_id") + facet_wrap(~sample_id) 
