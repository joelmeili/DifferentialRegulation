#!/bin/bash
samples=(1 2 3 4 5 6 16 17 18 19 20 21)

for sample in ${samples[@]}
  do
  alevin-fry generate-permit-list \
  -i brain_human/02_alevin_for_fry/organoid${sample} \
  -o brain_human/05_alevin_fry/organoid${sample} \
  -k -d fw
  
  alevin-fry collate \
  -r brain_human/02_alevin_for_fry/organoid${sample} \
  -i brain_human/05_alevin_fry/organoid${sample} \
  -t 32
  
  alevin-fry quant \
  -i brain_human/05_alevin_fry/organoid${sample} \
  -o brain_human/05_alevin_fry/organoid${sample} \
  -m brain_human/01_annotation/splici/transcriptome_splici_t2g_3col.tsv \
  -t 32 --use-mtx -d -r cr-like-em
  done