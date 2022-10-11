# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(ggplot2)
})

# load benchmark results
eisar_time <- readRDS("kidney_mouse/03_data/eisar_bench.rds")
dexseq_time <- readRDS("kidney_mouse/03_data/dexseq_bench.rds")
brie_time <- readRDS("kidney_mouse/03_data/brie_bench.rds")

# visualize computational benchmark
bench_mark <- data.frame(Method = c("BRIE2", "eisaR", "DEXSeq"),
												 Time = c(3, mean(unlist(eisar_time)),
												 				 mean(unlist(dexseq_time))))

g1 <- ggplot(bench_mark, aes(x = Method, y = Time)) +
	geom_bar(stat = "identity") + scale_y_log10() +
	theme_classic() + ylab("Time in seconds") +
	theme(axis.text.x = element_text(angle = 45, vjust = 0)) +
	ggtitle("Computational benchmark on the runtime of the differential methods")
g1

