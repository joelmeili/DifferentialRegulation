# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(ggplot2)
})

# visualize computational benchmark
bench_mark <- data.frame(Method = c("BRIE2", "eisaR"),
												 Time = c(1.31*24*60*60, 26))

g1 <- ggplot(bench_mark, aes(x = Method, y = Time)) +
	geom_bar(stat = "identity") + scale_y_log10() +
	theme_classic() + ylab("Time in seconds") +
	theme(axis.text.x = element_text(angle = 45, vjust = 0)) +
	ggtitle("Computational benchmark on the runtime of the differential methods")
g1

