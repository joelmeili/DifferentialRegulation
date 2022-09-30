suppressPackageStartupMessages({
  library(SingleCellExperiment)
})

rm(list = ls())

sim_dir <- "kidney_mouse/04_simulation_minnow/simulation/"
sim_dir_DGE <- "simulation/04_simulation_minnow/simulation_DGE/"

sce <- readRDS("kidney_mouse/03_data/mouse_simulation_data.rds")
sce_DGE <- readRDS("kidney_mouse/03_data/mouse_simulation_DGE_data.rds")

cts <- c("Adipocytes", "Epithelial cells", "Hepatocytes")

prepare_minnow <- function (sce, sim_dir) {
  for (samp in 1:4) {
    for (ct in cts) {
      temp <- sce[, sce$sample_id == samp & sce$cell_type == ct]
      
      gnames <- rownames(temp)
      bcs <- sub(paste0(samp, "."), "", colnames(temp))
      
      ct <- ifelse(ct == "Epithelial cells", "Epithelial_cells", ct)
      
      s <- assay(temp, "spliced")
      u <- assay(temp, "unspliced")
      
      pat <- paste0(samp, ".")
      out_dir <- file.path(sim_dir, paste0("normal", samp), ct)
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