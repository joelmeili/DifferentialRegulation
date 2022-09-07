#!/bin/bash
samples=(1 2 3 4)

for sample in ${samples[@]}
  do
  alevin-fry generate-permit-list \
  -i kidney_mouse/02_alevin_for_fry/normal${sample} \
  -o kidney_mouse/05_alevin_fry/normal${sample} \
  --force-cells 5000 -d fw
  
  alevin-fry collate \
  -r kidney_mouse/02_alevin_for_fry/normal${sample} \
  -i kidney_mouse/05_alevin_fry/normal${sample} \
  -t 32
  
  alevin-fry quant \
  -i kidney_mouse/05_alevin_fry/normal${sample} \
  -o kidney_mouse/05_alevin_fry/normal${sample} \
  -m kidney_mouse/01_annotation/splici/transcriptome_splici_t2g_3col.tsv \
  -t 32 --use-mtx -d -r cr-like-em
  done