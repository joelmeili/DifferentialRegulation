#!/bin/bash

# create folder
mkdir kidney_mouse
mkdir kidney_mouse/01_annotation
mkdir kidney_mouse/01_annoation/fastq
mkdir kidney_mouse/02_exploratory_analysis
mkdir kidney_mouse/03_simulation
mkdir kidney_mouse/04_differential_analysis

# download reference genome for mouse data
curl ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M24/gencode.vM24.annotation.gtf.gz --output kidney_mouse/01_annotation/gencode.vM24.annotation.gtf.gz
curl ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M24/GRCm38.primary_assembly.genome.fa.gz --output kidney_mouse/01_annotation/GRCm38.primary_assembly.genome.fa.gz
gunzip kidney_mouse/01_annotation/GRCm38.primary_assembly.genome.fa.gz