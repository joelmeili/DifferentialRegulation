# DifferentialRegulation

## Abstract

## Code

### Downloading the read files and reference genome

-   code/01_annotation/download_reads.sh
-   code/01_annotation/download_reference_genome.sh

### Create splici txome and run alevin on the data

-   code/01_annotation/alevin_fry_preparation.R
-   code/01_annotation/run_alevin_mouse.sh
### Run alevin-fry on the data

-   code/01_annotation/run_alevin_fry_mouse.sh

## Data availability

**Mouse kidney cells**: The raw data can be downloaded from NCBI GEO (accession number [GSE107585](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE107585)).

## Bioconductor package

[DifferentialRegulation](https://bioconductor.org/packages/release/bioc/html/DifferentialRegulation.html) (Tiberi, 2022) is a method for detecting differentially regulated genes between two groups of samples (e.g., healthy vs. disease, or treated vs. untreated samples), by targeting differences in the balance of spliced and unspliced mRNA abundances, obtained from single-cell RNA-sequencing (scRNA-seq) data. DifferentialRegulation accounts for the sample-to-sample variability, and embeds multiple samples in a Bayesian hierarchical model. In particular, when reads are compatible with multiple genes or multiple splicing versions of a gene (unspliced spliced or ambiguous), the method allocates these multi-mapping reads to the gene of origin and their splicing version. Parameters are inferred via Markov chain Monte Carlo (MCMC) techniques (Metropolis-within-Gibbs).
