import scvelo as scv
import matplotlib
import matplotlib.pyplot as plt

matplotlib.use("AGG")
scv.logging.print_version()

scv.settings.verbosity = 3
scv.settings.presenter_view = True
scv.set_figure_params("scvelo", fontsize = 6)

matplotlib.rcParams["figure.figsize"] = (6, 4)

fig_path = "figures/kidney_mouse/"

for i in range(1, 5):
    adata = scv.read("kidney_mouse/03_data/adata_normal" + str(i) + ".h5ad", cache = True)
    adata.layers["spliced"] = adata.X
    adata.obs = adata.obs.astype("category")
    adata.obs["clusters"] = adata.obs["cell_type"]

    temp_path = fig_path + "normal" + str(i) + "_"

    #########################################################
    # Basic preprocessing:
    #########################################################
    scv.pp.filter_and_normalize(adata, enforce = True)
    scv.pp.moments(adata)
    
    #########################################################
    # Plot proportions of spliced and unspliced reads:
    #########################################################   
    scv.pl.proportions(adata)
    plt.savefig(temp_path + "proportions.png", dpi = 300, bbox_inches = "tight")
    
    #########################################################
    # Velocity tools:
    #########################################################  
    scv.tl.recover_dynamics(adata, n_jobs = 32)
    scv.tl.velocity(adata, mode = "dynamical")
    scv.tl.velocity_graph(adata)

    scv.pl.velocity_embedding_stream(adata, basis = "UMAP")
    plt.savefig(temp_path + "dynamical_model_.png", dpi = 300, bbox_inches = "tight")