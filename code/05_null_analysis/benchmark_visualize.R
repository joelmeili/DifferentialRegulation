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
												 Time = c(mean(unlist(brie_time)), mean(unlist(eisar_time)),
												 				 mean(unlist(dexseq_time))))

g1 <- ggplot(bench_mark, aes(x = Method, y = Time)) +
	geom_bar(stat = "identity") + scale_y_log10() +
	theme_classic() + ylab("Time") +
	theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
	stat_identity(geom = "text", colour = "white", size = 2.5, aes(label = paste(round(Time, digits = 2), "seconds")), position = position_stack(vjust = 0.5)) +
	ggtitle("Computational benchmark on the runtime of the differential methods")
ggsave(g1, filename = "figures/null_analysis/bench_mark.png", height = 4, width = 6, scale = 1.5)