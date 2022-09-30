#!/bin/bash
minnow index -r kidney_mouse/01_annotation/splici/transcriptome_splici.fa -k 101 -f 20 \
--tmpdir kidney_mouse/04_simulation/tmp -p 8 \
-o kidney_mouse/04_simulation/minnow_ind |& stdbuf -oL tr '\r' '\n' > \
kidney_mouse/04_simulation/minnow_index.log

samples=(1 2 3 4)
celltypes=("Adipocytes" "Epithelial_cells" "Hepatocytes")
minnow_ind="kidney_mouse/04_simulation/minnow_ind"
g2t="kidney_mouse/01_annotation/splici/transcriptome_splici_t2g.tsv"

for sample in ${samples[@]}
do
  for type in ${celltypes[@]}
  do
      input_dir="kidney_mouse/04_simulation_minnow/simulation/normal$sample/$type"
      output_dir="kidney_mouse/04_simulation/simulation/normal${sample}_${type}_simulated_reads"
      log_file="kidney_mouse/04_simulation/simulation/minnow_simulate_normal${sample}_${type}.log"
      cmd="minnow simulate --splatter-mode --g2t $g2t --inputdir $input_dir --PCR 6 -r $minnow_ind/ref_k101_fixed.fa -e 0.01 -p 8 -o $output_dir --dbg --gfa $minnow_ind/dbg.gfa -w ~/minnow/data/737K-august-2016.txt --countProb ~/minnow/data/hg/countProb_pbmc_4k.txt --custom |& stdbuf -oL tr '\r' '\n' > $log_file"
      echo $cmd
      eval $cmd
  done
done