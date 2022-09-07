#!/bin/bash

salmon index \
-t kidney_mouse/01_annotation/splici/transcriptome_splici.fa \
-i kidney_mouse/01_annotation/splici/index_folder \
--gencode -p 32

## NORMAL1
salmon alevin -l ISR -i kidney_mouse/01_annotation/splici/index_folder \
-1 kidney_mouse/fastq/SRR6337197_1.fastq kidney_mouse/fastq/SRR6337198_1.fastq kidney_mouse/fastq/SRR6337199_1.fastq \
kidney_mouse/fastq/SRR6337200_1.fastq kidney_mouse/fastq/SRR6337201_1.fastq kidney_mouse/fastq/SRR6337202_1.fastq \
kidney_mouse/fastq/SRR6337203_1.fastq kidney_mouse/fastq/SRR6337204_1.fastq \
-2 kidney_mouse/fastq/SRR6337197_3.fastq kidney_mouse/fastq/SRR6337198_3.fastq kidney_mouse/fastq/SRR6337199_3.fastq \
kidney_mouse/fastq/SRR6337200_3.fastq kidney_mouse/fastq/SRR6337201_3.fastq kidney_mouse/fastq/SRR6337202_3.fastq \
kidney_mouse/fastq/SRR6337203_3.fastq kidney_mouse/fastq/SRR6337204_3.fastq \
-o kidney_mouse/02_alevin_for_fry/normal1/ -p 32 --chromium --sketch

## NORMAL2
salmon alevin -l ISR -i kidney_mouse/01_annotation/splici/index_folder \
-1 kidney_mouse/fastq/SRR6337205_1.fastq kidney_mouse/fastq/SRR6337206_1.fastq kidney_mouse/fastq/SRR6337207_1.fastq \
kidney_mouse/fastq/SRR6337208_1.fastq kidney_mouse/fastq/SRR6337209_1.fastq kidney_mouse/fastq/SRR6337210_1.fastq \
kidney_mouse/fastq/SRR6337211_1.fastq kidney_mouse/fastq/SRR6337212_1.fastq \
-2 kidney_mouse/fastq/SRR6337205_3.fastq kidney_mouse/fastq/SRR6337206_3.fastq kidney_mouse/fastq/SRR6337207_3.fastq \
kidney_mouse/fastq/SRR6337208_3.fastq kidney_mouse/fastq/SRR6337209_3.fastq kidney_mouse/fastq/SRR6337210_3.fastq \
kidney_mouse/fastq/SRR6337211_3.fastq kidney_mouse/fastq/SRR6337212_3.fastq \
-o kidney_mouse/02_alevin_for_fry/normal2/ -p 32 --chromium --sketch

## NORMAL3
salmon alevin -l ISR -i kidney_mouse/01_annotation/splici/index_folder \
-1 kidney_mouse/fastq/SRR6337213_1.fastq kidney_mouse/fastq/SRR6337214_1.fastq kidney_mouse/fastq/SRR6337215_1.fastq \
kidney_mouse/fastq/SRR6337216_1.fastq kidney_mouse/fastq/SRR6337217_1.fastq kidney_mouse/fastq/SRR6337218_1.fastq \
kidney_mouse/fastq/SRR6337219_1.fastq kidney_mouse/fastq/SRR6337220_1.fastq \
-2 kidney_mouse/fastq/SRR6337213_3.fastq kidney_mouse/fastq/SRR6337214_3.fastq kidney_mouse/fastq/SRR6337215_3.fastq \
kidney_mouse/fastq/SRR6337216_3.fastq kidney_mouse/fastq/SRR6337217_3.fastq kidney_mouse/fastq/SRR6337218_3.fastq \
kidney_mouse/fastq/SRR6337219_3.fastq kidney_mouse/fastq/SRR6337220_3.fastq \
-o kidney_mouse/02_alevin_for_fry/normal3/ -p 32 --chromium --sketch

## NORMAL4
salmon alevin -l ISR -i kidney_mouse/01_annotation/splici/index_folder \
-1 kidney_mouse/fastq/SRR6337221_1.fastq kidney_mouse/fastq/SRR6337222_1.fastq kidney_mouse/fastq/SRR6337223_1.fastq \
kidney_mouse/fastq/SRR6337224_1.fastq kidney_mouse/fastq/SRR6337225_1.fastq kidney_mouse/fastq/SRR6337226_1.fastq \
kidney_mouse/fastq/SRR6337227_1.fastq kidney_mouse/fastq/SRR6337228_1.fastq \
-2 kidney_mouse/fastq/SRR6337221_3.fastq kidney_mouse/fastq/SRR6337222_3.fastq kidney_mouse/fastq/SRR6337223_3.fastq \
kidney_mouse/fastq/SRR6337224_3.fastq kidney_mouse/fastq/SRR6337225_3.fastq kidney_mouse/fastq/SRR6337226_3.fastq \
kidney_mouse/fastq/SRR6337227_3.fastq kidney_mouse/fastq/SRR6337228_3.fastq \
-o kidney_mouse/02_alevin_for_fry/normal4/ -p 32 --chromium --sketch
