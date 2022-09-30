# clean-up environment
rm(list = ls())

# load libraries
source("code/03_simulation/mouse_simulation.R")

# load mouse data
sce <- readRDS("kidney_mouse/03_data/mouse_data_fry_USA.rds")

# setup parallel
n_cores <- 4
cl <- makeCluster(n_cores)
registerDoParallel(cl)

# filter cell types
CLUSTERS <- c("Epithelial cells", "Adipocytes", "Hepatocytes")
sce <- sce[, sce$cell_type %in% CLUSTERS]

# set arbitrary condition
GROUP <- c("A", "B", "A", "B")
sce$group <- ifelse(sce$sample_id %in% c("1", "3"), "A", "B")

# set parameters for simulation
p_genes <- 0.1
p_cells <- 1
p_genes_DGE <- 0.1
p_cells_DGE <- 1
FC <- 10

# simulate mouse data based on preset parameters
sim <- mouse_simulation(sce = sce, CLUSTERS = CLUSTERS, 
                      p_genes = p_genes, p_cells = p_cells)

sim_DGE <- add_DGE(sce = sim, CLUSTERS = CLUSTERS, 
                   p_genes_DGE = p_genes_DGE, p_cells_DGE = p_cells_DGE, FC = FC)

# save simulated data sets
saveRDS(sim, file = "kidney_mouse/03_data/mouse_simulation_data.rds")
saveRDS(sim_DGE, file = "kidney_mouse/03_data/mouse_simulation_DGE_data.rds")