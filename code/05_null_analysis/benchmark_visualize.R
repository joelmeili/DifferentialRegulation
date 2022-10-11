# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(ggplot2)
})

eisar_time <- 
brie_time <- 

time <- data.frame(Method = c("BRIE2", "eisaR", "DEXSeq", "DR"),
									 Time = c(1.31431*24*60, 47.83077/60))