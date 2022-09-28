#!/bin/bash

## RUN ANNOTATION PIPELINE
bash code/01_annotation/download_reference_genome.sh
bash code/01_annotation/download_reads.sh
R313script code/01_annotation/alevin_fry_preparation.R
bash code/01_annotation/run_alevin_mouse.sh
bash code/01_annotation/run_alevin_fry_mouse.sh