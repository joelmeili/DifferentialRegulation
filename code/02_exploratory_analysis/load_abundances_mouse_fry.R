# clean environment
rm(list = ls())

# load packages
suppressPackageStartupMessages({
  library(fishpond)
  library(SingleCellExperiment)
  library(scater)
  library(celldex)
  library(SingleR)
  library(anndata)
  library(zellkonverter)
})

# load abundances
sample_ids <- 1:4

load_abundances <- function (sample_id) {
  path <- paste0("kidney_mouse/02_data_fry/", paste0("normal", sample_id))
  temp <- loadFry(path, outputFormat = "raw", nonzero = FALSE, quiet = TRUE)
  temp$sample_id <- sample_id
  colnames(temp) <- paste0(sample_id, ".", colnames(temp))
  return (temp)
}

run <- function () {
  sces <- lapply(sample_ids, FUN = function (sid) {
      load_abundances(sample_id = sid)
  })
  
  sces <- unlist(sces)
  sce <- do.call("cbind", sces)
  
  counts(sce) <- assays(sce)$spliced
  assays(sce)$TOT_counts <- assays(sce)$spliced + assays(sce)$unspliced + assays(sce)$ambiguous
  
  # remove undetected genes
  sce <- sce[rowSums(assays(sce)$TOT_counts > 0) > 0, ]
  
  # calculate per-cell quality control (QC) metrics
  qc <- perCellQCMetrics(sce)
  
  # remove cells with few or many detected genes
  ol <- isOutlier(metric = qc$detected, nmads = 2, log = TRUE)
  sce <- sce[, !ol]
  
  # remove lowly expressed genes: at least 10 non-zero cells:
  sce <- sce[rowSums(assays(sce)$TOT_counts > 0) >= 10, ]
  
  # compute sum-factors & normalize
  sce <- computeLibraryFactors(sce)
  sce <- logNormCounts(sce)
  
  return (sce)
}

sce <- run()

# assign gene names and cell types
ref <- celldex::MouseRNAseqData(ensembl = TRUE, cell.ont = "all")

# check how many gene names match btw the 2 datasets:
gene_ids <- rownames(sce)
rownames(sce) <- substr(rownames(sce), 1, 18)

pred <- SingleR(test = sce, ref = ref, labels = ref$label.main)
sce$cell_type <- pred$labels
rownames(sce) <- gene_ids

metadata(sce) <- list()

# run dimensionality reduction algorithm
sce <- runPCA(sce)
sce <- runUMAP(sce)

# save data
saveRDS(sce, file = "kidney_mouse/03_data/mouse_data_fry_USA.rds")