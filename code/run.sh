#!/bin/bash

# create folders
mkdir kidney_mouse
mkdir kidney_mouse/01_annotation
mkdir kidney_mouse/fastq
mkdir kidney_mouse/02_data_alevin
mkdir kidney_mouse/02_data_alevin/normal1
mkdir kidney_mouse/02_data_alevin/normal2
mkdir kidney_mouse/02_data_alevin/normal3
mkdir kidney_mouse/02_data_alevin/normal4
mkdir kidney_mouse/02_data_fry
mkdir kidney_mouse/02_data_fry/normal1
mkdir kidney_mouse/02_data_fry/normal2
mkdir kidney_mouse/02_data_fry/normal3
mkdir kidney_mouse/02_data_fry/normal4
mkdir kidney_mouse/03_data
mkdir kidney_mouse/04_simulation
mkdir kidney_mouse/05_simulation_minnow
mkdir kidney_mouse/06_null_analysis

# run pipeline
bash code/01_annotation/run.sh