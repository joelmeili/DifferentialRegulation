# load libraries
suppressPackageStartupMessages({
  library(muscat)
  library(eisaR)
  library(DEXSeq)
	library(BiocParallel)
})

# differential analysis
prepare_bulk <- function (sce, GROUP, method = "US") {
  # prepare sce for pseudobulk
  sce$group_id <- 1
  sce$clusters <- sce$cell_type
  
  sce <- prepSCE(sce, 
                 kid = "clusters", # subpopulation assignments
                 sid = "sample_id", # sample IDs (ctrl/stim.1234)
                 drop = TRUE) # drop all other colData columns
  
  # compute pseudo-bulk (PB) spliced and unspliced counts
  pb_S <- aggregateData(sce,
                        assay = "spliced", 
                        fun = "sum",
                        by = c("cluster_id", "sample_id"))
  
  pb_U <- aggregateData(sce,
                        assay = "unspliced", 
                        fun = "sum",
                        by = c("cluster_id", "sample_id"))
  
  if (method == "USA") {
  	pb_A <- aggregateData(sce,
  										assay = "ambiguous",
  										fun = "sum",
  										by = c("cluster_id", "sample_id"))
  	
  	return (list(pb_S, pb_U, pb_A))
  	
  } else {
  	
  	return (list(pb_S, pb_U))
  }
}

run_eisar <- function (sce, GROUP, method = "US") {
  # pseudobulk data
  bulk <- prepare_bulk(sce, GROUP, method = "US")
  pb_S <- bulk[[1]]; pb_U <- bulk[[2]]
  
  # run eisaR
  R_ex <- assays(pb_S)[[1]]; R_in <- assays(pb_U)[[1]]
  tab <- runEISA(cntEx  = R_ex, cntIn = R_in, cond = GROUP, geneSelection = "none")$tab.ExIn
  
  # initialize results data frame
  RES <- data.frame(Gene_id = rownames(tab),
                    p_eisaR = tab$PValue,
                    p_eisaR_adj = p.adjust(tab$PValue, method = "BH"))
  
  return (RES)
}

run_dexseq <- function (sce, GROUP){
	# pseudobulk data
	bulk <- prepare_bulk(sce, GROUP, method = "USA")
	pb_S <- bulk[[1]]; pb_U <- bulk[[2]]; pb_A <- bulk[[3]]
	
	# prepare design matrix
	genes <- rownames(pb_S)
	group <- GROUP
	n_genes <- length(genes)
	design <- data.frame(condition = factor(group))
	spliced_unspliced_ambiguous <- factor(c(rep("S", n_genes), rep("U", n_genes),  rep("A", n_genes)))
	counts <- rbind(assays(pb_S)[[1]], assays(pb_U)[[1]], assays(pb_A)[[1]])
	
	# set parallel cores:
	BPPARAM = MulticoreParam(6)
	
	# analyze each cluster separately:
	dxd <- DEXSeqDataSet(countData = round(counts),
											 sampleData = design,
											 design = ~sample + exon + condition:exon,
											 featureID = spliced_unspliced_ambiguous,
											 groupID = rep(genes, 3))
	
	dxd <- estimateSizeFactors(dxd)
	dxd <- estimateDispersions(dxd, quiet = TRUE)
	dxd <- testForDEU(dxd, reducedModel = ~sample + exon)
	
	dxr <- DEXSeqResults(dxd, independentFiltering = FALSE)
	
	# select S only:
	dxr <- dxr[dxr$featureID == "S",]
	
	# initialize results data frame
	RES <- data.frame(Gene_id = dxr$groupID,
										p_DEXSeq = dxr$pvalue,
										p_DEXSeq_adj = dxr$padj)
	
	return (RES)
}