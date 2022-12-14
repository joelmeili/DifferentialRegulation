#!/bin/bash

# download reference genome for mouse data
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M24/gencode.vM24.annotation.gtf.gz -O kidney_mouse/01_annotation/gencode.vM24.annotation.gtf.gz
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M24/GRCm38.primary_assembly.genome.fa.gz -O kidney_mouse/01_annotation/GRCm38.primary_assembly.genome.fa.gz
gunzip kidney_mouse/01_annotation/GRCm38.primary_assembly.genome.fa.gz