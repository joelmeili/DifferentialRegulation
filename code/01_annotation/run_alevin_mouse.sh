#!/bin/bash

## salmon indexing
salmon index \
-t kidney_mouse/01_annotation/splici/transcriptome_splici.fa \
-i kidney_mouse/01_annotation/splici/index_folder \
--gencode -p 32

## NORMAL1
salmon alevin -l ISR -i kidney_mouse/01_annotation/splici/index_folder \
-1 kidney_mouse/fastq/SRR6337197_1.fastq kidney_mouse/fastq/SRR6337198_1.fastq kidney_mouse/fastq/SRR6337199_1.fastq \
kidney_mouse/fastq/SRR6337200_1.fastq kidney_mouse/fastq/SRR6337201_1.fastq kidney_mouse/fastq/SRR6337202_1.fastq \
kidney_mouse/fastq/SRR6337203_1.fastq kidney_mouse/fastq/SRR6337204_1.fastq \
-2 kidney_mouse/fastq/SRR6337197_2.fastq kidney_mouse/fastq/SRR6337198_2.fastq kidney_mouse/fastq/SRR6337199_2.fastq \
kidney_mouse/fastq/SRR6337200_2.fastq kidney_mouse/fastq/SRR6337201_2.fastq kidney_mouse/fastq/SRR6337202_2.fastq \
kidney_mouse/fastq/SRR6337203_2.fastq kidney_mouse/fastq/SRR6337204_2.fastq \
-o kidney_mouse/02_data/normal1/ -p 32 --chromium --sketch

## NORMAL2
salmon alevin -l ISR -i kidney_mouse/01_annotation/splici/index_folder \
-1 kidney_mouse/fastq/SRR6337205_1.fastq kidney_mouse/fastq/SRR6337206_1.fastq kidney_mouse/fastq/SRR6337207_1.fastq \
kidney_mouse/fastq/SRR6337208_1.fastq kidney_mouse/fastq/SRR6337209_1.fastq kidney_mouse/fastq/SRR6337210_1.fastq \
kidney_mouse/fastq/SRR6337211_1.fastq kidney_mouse/fastq/SRR6337212_1.fastq \
-2 kidney_mouse/fastq/SRR6337205_2.fastq kidney_mouse/fastq/SRR6337206_2.fastq kidney_mouse/fastq/SRR6337207_2.fastq \
kidney_mouse/fastq/SRR6337208_2.fastq kidney_mouse/fastq/SRR6337209_2.fastq kidney_mouse/fastq/SRR6337210_2.fastq \
kidney_mouse/fastq/SRR6337211_2.fastq kidney_mouse/fastq/SRR6337212_2.fastq \
-o kidney_mouse/02_data/normal2/ -p 32 --chromium --sketch

## NORMAL3
salmon alevin -l ISR -i kidney_mouse/01_annotation/splici/index_folder \
-1 kidney_mouse/fastq/SRR6337213_1.fastq kidney_mouse/fastq/SRR6337214_1.fastq kidney_mouse/fastq/SRR6337215_1.fastq \
kidney_mouse/fastq/SRR6337216_1.fastq kidney_mouse/fastq/SRR6337217_1.fastq kidney_mouse/fastq/SRR6337218_1.fastq \
kidney_mouse/fastq/SRR6337219_1.fastq kidney_mouse/fastq/SRR6337220_1.fastq \
-2 kidney_mouse/fastq/SRR6337213_2.fastq kidney_mouse/fastq/SRR6337214_2.fastq kidney_mouse/fastq/SRR6337215_2.fastq \
kidney_mouse/fastq/SRR6337216_2.fastq kidney_mouse/fastq/SRR6337217_2.fastq kidney_mouse/fastq/SRR6337218_2.fastq \
kidney_mouse/fastq/SRR6337219_2.fastq kidney_mouse/fastq/SRR6337220_2.fastq \
-o kidney_mouse/02_data/normal3/ -p 32 --chromium --sketch

## NORMAL4
salmon alevin -l ISR -i kidney_mouse/01_annotation/splici/index_folder \
-1 kidney_mouse/fastq/SRR6337221_1.fastq kidney_mouse/fastq/SRR6337222_1.fastq kidney_mouse/fastq/SRR6337223_1.fastq \
kidney_mouse/fastq/SRR6337224_1.fastq kidney_mouse/fastq/SRR6337225_1.fastq kidney_mouse/fastq/SRR6337226_1.fastq \
kidney_mouse/fastq/SRR6337227_1.fastq kidney_mouse/fastq/SRR6337228_1.fastq \
-2 kidney_mouse/fastq/SRR6337221_2.fastq kidney_mouse/fastq/SRR6337222_2.fastq kidney_mouse/fastq/SRR6337223_2.fastq \
kidney_mouse/fastq/SRR6337224_2.fastq kidney_mouse/fastq/SRR6337225_2.fastq kidney_mouse/fastq/SRR6337226_2.fastq \
kidney_mouse/fastq/SRR6337227_2.fastq kidney_mouse/fastq/SRR6337228_2.fastq \
-o kidney_mouse/02_data/normal4/ -p 32 --chromium --sketch
