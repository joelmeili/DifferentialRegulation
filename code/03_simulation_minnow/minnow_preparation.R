# clean environment
rm(list = ls())

# load libraries
suppressPackageStartupMessages({
  library(SingleCellExperiment)
})

# prepare for minnow simulation
sim_dir <- "kidney_mouse/04_simulation_minnow/simulation/"
sim_dir_DGE <- "kidney_mouse/04_simulation_minnow/simulation_DGE/"

sce <- readRDS("kidney_mouse/03_data/mouse_simulation_data.rds")
sce_DGE <- readRDS("kidney_mouse/03_data/mouse_simulation_DGE_data.rds")

cell_types <- c("Adipocytes", "Epithelial cells", "Hepatocytes")

prepare_minnow <- function (sce, sim_dir) {
  for (sample_id in 1:4) {
    for (cell_type in cell_types) {
      temp <- sce[, sce$sample_id == sample_id & sce$cell_type == cell_type]
      
      gnames <- rownames(temp)
      bcs <- sub(paste0(sample_id, "."), "", colnames(temp))
      
      ct <- ifelse(cell_type == "Epithelial cells", "Epithelial_cells", cell_type)
      
      s <- assay(temp, "spliced")
      u <- assay(temp, "unspliced")
      
      pat <- paste0(sample_id, ".")
      out_dir <- file.path(sim_dir, paste0("normal", sample_id), cell_type)
      dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
      
      colnames(s) <- sub(pat, "", colnames(s))
      colnames(u) <- sub(pat, "", colnames(u))
      M <- as.matrix(rbind(s, u))
      
      write.table(M, file = file.path(out_dir, "quants_mat.csv"),
                  sep = ",", quote = FALSE, row.names = FALSE, col.names = FALSE)
      write.table(c(gnames, paste0(gnames, "-U")), file = file.path(out_dir, "quants_mat_rows.txt"), quote = FALSE, row.names = FALSE, col.names = FALSE)
      write.table(bcs, file = file.path(out_dir, "quants_mat_cols.txt"), quote = FALSE, row.names = FALSE, col.names = FALSE)
    }
  }
}

prepare_minnow(sce, sim_dir)
prepare_minnow(sce_DGE, sim_dir_DGE)