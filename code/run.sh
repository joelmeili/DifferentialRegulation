#!/bin/bash

# create folders
mkdir kidney_mouse
mkdir kidney_mouse/01_annotation
mkdir kidney_mouse/fastq
mkdir kidney_mouse/02_data
mkdir kidney_mouse/02_data_fry
mkdir kidney_mouse/03_simulation
mkdir kidney_mouse/04_simulation_minnow
mkdir kidney_mouse/05_figures

# run pipelines
bash code/01_annotation/annotation_pipeline.sh