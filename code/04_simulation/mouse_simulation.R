# load libraries
suppressPackageStartupMessages({
  library(SingleCellExperiment)
  library(doParallel)
  library(doRNG)
})

# simulation of mouse data
mouse_simulation <- function (sce, CLUSTERS, 
                              p_genes = 0.1, p_cells = 0.3) {
  sim <- foreach(
    i = 1:length(CLUSTERS),
    .packages = "Matrix"
  ) %dorng% {
    # select cluster
    temp <- sce[, sce$cell_type == CLUSTERS[[i]]]
    
    # remove lowly expressed genes: at least 10 non-zero cells:
    filter <- (rowSums(assays(temp)$TOT_counts[, temp$group == "A"] > 0) >= 10) & (rowSums(assays(temp)$TOT_counts[, temp$group == "B"] > 0) >= 10)
    
    # randomly draw proportion of genes and store ground truth
    genes <- sample(rownames(temp)[filter], size = p_genes*sum(filter), replace = FALSE)
    truth <- data.frame(Gene_id = rownames(temp), Cell_type = CLUSTERS[[i]],
                        truth = ifelse(rownames(temp) %in% genes, 1, 0))
    
    # randomly select proportion of cells in one condition
    cells <- sample(colnames(temp[, temp$group == "A"]),
                    size = p_cells*ncol(temp[, temp$group == "A"]),
                    replace = FALSE)
    spliced <- assays(temp)$spliced; unspliced <- assays(temp)$unspliced
    assays(temp)$spliced[rownames(temp) %in% genes, colnames(temp) %in% cells] <- unspliced[rownames(temp) %in% genes, colnames(temp) %in% cells]
    assays(temp)$unspliced[rownames(temp) %in% genes, colnames(temp) %in% cells] <- spliced[rownames(temp) %in% genes, colnames(temp) %in% cells]
    
    return (list(SCE = temp, truth = truth))
  }
  
  SCES <- rep(list(NA, length(CLUSTERS)))
  TRUTH <- rep(list(NA, length(CLUSTERS)))
  
  for (i in 1:length(CLUSTERS)) {
    SCES[[i]] <- sim[[i]][[1]]; TRUTH[[i]] <- sim[[i]][[2]]
  }
  
  SCE <- do.call("cbind", SCES)
  metadata(SCE)$truth <- do.call("rbind", TRUTH)
  
  return (SCE)
}

add_DGE <- function (sce, CLUSTERS,  
                     p_genes_DGE = 0.1, p_cells_DGE = 1, FC = 2) {
  # store truth from first simulation
  truth_DA <- metadata(sce)$truth
  metadata(sce)$truth <- NULL
  
  sim <- foreach(
    i = 1:length(CLUSTERS),
    .packages = "Matrix"
  ) %dorng% {
    # select cluster
    temp <- sce[, sce$cell_type == CLUSTERS[[i]]]
    
    # remove lowly expressed genes: at least 10 non-zero cells:
    filter <- (rowSums(assays(temp)$TOT_counts[, temp$group == "A"] > 0) >= 10) & (rowSums(assays(temp)$TOT_counts[, temp$group == "B"] > 0) >= 10)
    
    # randomly draw proportion of genes and store ground truth
    genes <- sample(rownames(temp)[filter], size = p_genes_DGE*sum(filter), replace = FALSE)
    truth <- data.frame(Gene_id = rownames(temp), Cell_type = CLUSTERS[[i]],
                        truth_DGE = ifelse(rownames(temp) %in% genes, 1, 0),
                        FC = ifelse(rownames(temp) %in% genes, FC, 1))
    
    # randomly select proportion of cells in one condition
    cells <- sample(colnames(temp[, temp$group == "A"]),
                    size = p_cells_DGE*ncol(temp[, temp$group == "A"]),
                    replace = FALSE)
    spliced <- assays(temp)$spliced; unspliced <- assays(temp)$unspliced
    assays(temp)$spliced[rownames(temp) %in% genes, colnames(temp) %in% cells] <- FC*spliced[rownames(temp) %in% genes, colnames(temp) %in% cells]
    assays(temp)$unspliced[rownames(temp) %in% genes, colnames(temp) %in% cells] <- FC*unspliced[rownames(temp) %in% genes, colnames(temp) %in% cells]
    assays(temp)$TOT_counts <- assays(temp)$spliced + assays(temp)$unspliced
    
    return (list(SCE = temp, truth = truth))
  }
  
  SCES <- rep(list(NA, length(CLUSTERS)))
  TRUTH <- rep(list(NA, length(CLUSTERS)))
  
  for (i in 1:length(CLUSTERS)) {
    SCES[[i]] <- sim[[i]][[1]]; TRUTH[[i]] <- sim[[i]][[2]]
  }
  
  SCE <- do.call("cbind", SCES)
  truth_DGE <- do.call("rbind", TRUTH)
  metadata(SCE)$truth <- merge(truth_DA, truth_DGE, by = c("Gene_id", "Cell_type"), all.x = TRUE)
  
  return (SCE)
  
}