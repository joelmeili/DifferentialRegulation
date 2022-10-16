#!/bin/bash

# download reference genome for mouse data
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M24/gencode.vM24.annotation.gtf.gz --output kidney_mouse/01_annotation/gencode.vM24.annotation.gtf.gz
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M24/GRCm38.primary_assembly.genome.fa.gz --output kidney_mouse/01_annotation/GRCm38.primary_assembly.genome.fa.gz
gunzip kidney_mouse/01_annotation/GRCm38.primary_assembly.genome.fa.gz

# download reference genome for human data
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/gencode.v38.annotation.gtf.gz --output brain_human/01_annotation/gencode.v38.annotation.gtf.gz
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/GRCh38.primary_assembly.genome.fa.gz --output brain_human/01_annotation/GRCh38.primary_assembly.genome.fa.gz
gunzip brain_human/01_annotation/GRCh38.primary_assembly.genome.fa.gz
