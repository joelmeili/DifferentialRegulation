import scvelo as scv
import matplotlib
import matplotlib.pyplot as plt
matplotlib.use("AGG")

scv.logging.print_version()

scv.settings.verbosity = 3
scv.settings.presenter_view = True
scv.set_figure_params("scvelo")

fig_path = "figures/kidney_mouse/"

for i in range(1, 2):
    adata = scv.read("kidney_mouse/03_data/adata_normal" + str(i) + ".h5ad", cache = True)
    adata.layers["spliced"] = adata.X

    # show spliced and unspliced proportion
    scv.pl.proportions(adata)
    plt.savefig(fname = fig_path + "proportions_normal" + str(i) + ".png")

    # basic preprocessing
    scv.pp.filter_and_normalize(adata, enforce = True)
    scv.pp.normalize_per_cell(adata, enforce = True)
    scv.pp.filter_genes_dispersion(adata, n_top_genes = 2000)
    scv.pp.log1p(adata)
    scv.pp.filter_and_normalize(adata, min_shared_counts = 20, n_top_genes = 2000)
    scv.pp.moments(adata, n_pcs = 30, n_neighbors = 30)

    # estimate RNA velocity
    scv.tl.velocity(adata)
    scv.tl.velocity_graph(adata)

    # visualize RNA velocity
    scv.pl.velocity_embedding_stream(adata, basis = "UMAP")
    scv.pl.velocity_embedding(adata, arrow_length = 3, arrow_size = 2, dpi = 120)

