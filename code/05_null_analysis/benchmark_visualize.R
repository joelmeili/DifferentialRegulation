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
bench_mark <- data.frame(Method = c("BRIE2", "DEXSeq", "eisaR"),
												 Time = c(mean(unlist(brie_time))/60, mean(unlist(dexseq_time))/60,
												 				 mean(unlist(eisar_time))/60))

g1 <- ggplot(bench_mark, aes(x = Method, y = Time)) +
	geom_bar(stat = "identity") + scale_y_sqrt(breaks = c(1, 5, 15, 30, 60, 120, 180, 500, 1000, 2000, 3000, 4000)) + theme_classic() + ylab("Time (sqrt-scaled)") +
	theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
	stat_identity(geom = "text", colour = "white", size = 2.5, aes(label = paste(round(Time, digits = 2), "minutes")), position = position_stack(vjust = 0.5)) +
	ggtitle("Average runtime of the differential methods on the Null data set on all three group separations")
ggsave(g1, filename = "figures/null_analysis/bench_mark.png", height = 3, width = 6, scale = 1.5)