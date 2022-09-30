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
    plt.savefig(temp_path + "dynamical_model_combined.png", dpi = 300, bbox_inches = "tight")

    #########################################################
    # Velocity pseudotime:
    #########################################################
    scv.pl.velocity_graph(adata, threshold = 0.1)
    plt.savefig(temp_path + "velocity_threshold.png", dpi = 300, bbox_inches = "tight")
    
    x, y = scv.utils.get_cell_transitions(adata, basis = "UMAP")
    ax = scv.pl.velocity_graph(adata, c = "lightgrey", edge_width = 0.05, show = False)
    ax = scv.pl.scatter(adata, x = x, y = y, s = 120, c = "ascending", cmap = "gnuplot", ax = ax)
    plt.savefig(temp_path + "cell_transitions.png", dpi = 300, bbox_inches = "tight")
    
    scv.tl.velocity_pseudotime(adata)
    scv.pl.scatter(adata, color = "velocity_pseudotime", cmap = "gnuplot")
    plt.savefig(temp_path + "velocity_pseudo_time_graph.png", dpi = 300, bbox_inches = "tight")
    
    #########################################################
    # latent-time graph:
    #########################################################
    scv.tl.latent_time(adata)
    scv.pl.scatter(adata, color = "latent_time", color_map = "gnuplot", size = 80)
    plt.savefig(temp_path + "velocity_latent_time_graph.png", dpi = 300, bbox_inches = "tight")
    
    #########################################################
    # PAGA:
    #########################################################
    adata.uns["neighbors"]["distances"] = adata.obsp["distances"]
    adata.uns["neighbors"]["connectivities"] = adata.obsp["connectivities"]
    
    scv.tl.paga(adata, groups = "clusters")
    df = scv.get_df(adata, "paga/transitions_confidence", precision = 2).T
    df.style.background_gradient(cmap = "Blues").format("{:.2g}")
    
    scv.pl.paga(adata, basis = "UMAP", size = 50, alpha = 0.1,
                min_edge_width = 2, node_size_scale = 1.5)
                
    plt.savefig(temp_path + "PAGA.png", dpi = 300, bbox_inches = "tight")
    
    #########################################################
    # Speed and coherence:
    #########################################################
    scv.tl.velocity_confidence(adata)
    keys = "velocity_length", "velocity_confidence"
    scv.pl.scatter(adata, c = keys, cmap = "coolwarm", perc = [5, 95])
    plt.savefig(temp_path + "speed.png", dpi = 300, bbox_inches = "tight")
    
    #########################################################
    # Calculate average velocity:
    #########################################################
    velo = adata.layers["velocity"] # cells are rows, genes are columns
    velo = abs(velo)
    clusters = adata.obs["clusters"].values
    
    velo = pd.DataFrame(velo)
    velo["clusters"] = clusters
    
    avg_velo = velo.groupby("clusters").mean().transpose()
    avg_velo.to_csv("kidney_mouse/03_data/" + "avg_velo_sample" + str(i) + ".csv")