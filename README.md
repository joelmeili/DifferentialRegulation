# DifferentialRegulation

## Abstract
Single-cell RNA sequencing data has become more and more popular over the past few years. It allows answering biological questions that with bulk RNA sequencing could not be answered as cell-specific characteristics can be analyzed. In this thesis we investigate, in each cell cluster (e.g. cell type), how the relative abundance of spliced and unspliced reads varies between experimental conditions. Changes to these relative abundances are directly linked to gene regulation, therefore differences in these proportions are taken as a proxy for differences in gene regulation. Methods that are capable of detecting differences in relative abundance already exist (e.g. BRIE2 and eisaR ), however they neglect two sources of mapping uncertainty: i) multi-mapping reads across spliced and unspliced versions of a gene, and ii) reads compatible with multiple genes. Therefore, we propose a novel method, DifferentialRegulation, that tackles this issue and evaluate the performance of the existing methods (BRIE2, DEXSeq and eisaR ) and our novel approach.
For this we created two semi-simulated data sets, using real mouse kidney single-cell RNA sequencing data as an anchor data set to simulate from. From the analysis we conclude that the two methods that account for mapping uncertainty (DEXSeq and DifferentialRegulation) have significantly higher TPR and better control of FDR than the methods that ignore mapping uncertainty. Additionally, we studied methods robustness by investigating how gene abundance
levels, and differential gene expression (a nuisance effect in this analysis), affect the results of each method. We also ran a null analysis on a real data set (where no differences between groups are expected), to study methods' false positive rates. Lastly, we ran a computational benchmark on the mouse kidney data to evaluate the computational burden of each method.

## Code

### Downloading the read files and reference genome

-   code/01_annotation/download_reads_mouse.sh (downloads the all the read files and converts them to fastq-format)
-   code/01_annotation/download_reference_genome.sh (downloads the reference genome and annotation for the mouse data)

### Create splici txome and run alevin on the data

-   code/01_annotation/alevin_fry_preparation.R (creates the splici txome for indexing and alevin-fry)
-   code/01_annotation/run_alevin_mouse.sh (runs salmon indexing and alevin on the downloaded read files)

### Run alevin-fry on the data

-   code/01_annotation/run_alevin_fry_mouse.sh (runs alevin-fry on the output from alevin)

### Exploratory data analysis

- code/02_exploratory_analysis/load_abundances_fry.R (loads the raw data from alevin-fry into R; also runs QC and cell-type annotation on the data)
- code/02_exploratory_analysis/eda.R (produces a plot of the cell type distribution and shows the UMAP of the cell structure based on sample id and cell type)
- code/02_exploratory_analysis/convert_sce.R (converts the SingleCellExperiment object of R into anndata format so that scVelo can be run on it)
- code/02_exploratory_analysis/rna_velocity.py (runs scVelo pipeline on each sample and produces plots of spliced/unspliced proportions and dynamical model showing the RNAVelocity for each sample)

### Naive simulation
- code/03_simulation/mouse_simulation.R (contains two functions: mouse_simulation and add_DGE; the first function contains the simulation algorithm for the naive simulation and the second function adds differential gene expression as a nuisance parameter)
- code/03_simulation/run_simulation_mouse.R (runs the simulation algorithm and creates two semi-simulated data sets and saves them as .rds-files)

### Simulation with mapping uncertainty
- code/03_simulation_minnow/minnow_preparation.R (converts the two simulated data sets into the format required for minnow to be run on)
- code/03_simulation_minnow/run_minnow.sh (runs minnow for each cell type in each sample individually and outputs the results for further alignment and quantification with alevin-fry)

### Differential analysis
- code/04_differential_analysis/differential_analysis.R
- code/04_differential_analysis/run_differential_analysis.R
- code/04_differential_analysis/DA_simulation.R

## Data availability

**Mouse kidney cells**: The raw data can be downloaded from NCBI GEO (accession number [GSE107585](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE107585)).

## Bioconductor package

[DifferentialRegulation](https://bioconductor.org/packages/release/bioc/html/DifferentialRegulation.html) (Tiberi, 2022) is a method for detecting differentially regulated genes between two groups of samples (e.g., healthy vs. disease, or treated vs. untreated samples), by targeting differences in the balance of spliced and unspliced mRNA abundances, obtained from single-cell RNA-sequencing (scRNA-seq) data. DifferentialRegulation accounts for the sample-to-sample variability, and embeds multiple samples in a Bayesian hierarchical model. In particular, when reads are compatible with multiple genes or multiple splicing versions of a gene (unspliced spliced or ambiguous), the method allocates these multi-mapping reads to the gene of origin and their splicing version. Parameters are inferred via Markov chain Monte Carlo (MCMC) techniques (Metropolis-within-Gibbs).
