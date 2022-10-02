# clean environment
rm(list = ls())

# import libraries
suppressPackageStartupMessages({
	library(ggplot2)
})

# load data
results_eisar <- readRDS("kidney_mouse/03_data/eisar_res_US.rds")

# GROUPS
GROUPS <- list(c("A", "A", "B", "B"),
							 c("A", "B", "A", "B"),
							 c("A", "B", "B", "A"))

GROUPS_LABELLER <- list(
	"Group#1" = "A A B B",
	"Group#2" = "A B A B",
	"Group#3" = "A B B A"
)

# visualize p-value distribution of eisaR
for (i in 1:length(GROUPS)) {
	results_eisar[[i]]$Group <- i
	results_eisar[[i]]$Method <- "eisaR"
}


group_labeller <- function(variable, value){
	return (GROUPS_LABELLER[value])
}

results_eisar <- do.call("rbind", results_eisar)

ggplot(results_eisar, aes(x = p_eisaR)) + geom_histogram(aes(y = ..density..)) +
	 geom_density(alpha = 0.2) + facet_grid(~ Group, labeller = group_labeller) + theme_classic() +
	xlab("P-value") + ylab("Density") + ggtitle("P-value distribution across all three possible group separations")

