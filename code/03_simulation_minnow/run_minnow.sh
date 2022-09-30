#!/bin/bash
~/minnow/build/src/minnow index -r kidney_mouse/01_annotation/GRCm38.primary_assembly.genome.fa -k 101 -f 20 \
--tmpdir simulation/04_minnow_sim/tmp -p 8 \
-o simulation/04_minnow_sim/minnow_ind |& stdbuf -oL tr '\r' '\n' > \
simulation/04_minnow_sim/minnow_index.log

samples = (1 2 3 4)
celltypes = ("Adipocytes" "Epithelial_cells" "Hepatocytes")
minnow = "~/minnow/build/src/minnow"
minnow_ind = "kidney_mouse/04_simulation_minnow/minnow_ind"
g2t = "simulation/03_tominnow/annotation.expanded.tx2gene.tsv"

for sample in ${samples[@]}
do
  for type in ${celltypes[@]}
  do
      input_dir="simulation/03_tominnow/simulation/normal$sample/$type"
      output_dir="simulation/04_minnow_sim/simulation/normal${sample}_${type}_simulated_reads"
      log_file="simulation/04_minnow_sim/simulation/minnow_simulate_normal${sample}_${type}.log"
      cmd="$minnow simulate --splatter-mode --g2t $g2t --inputdir $input_dir --PCR 6 -r $minnow_ind/ref_k101_fixed.fa -e 0.01 -p 8 -o $output_dir --dbg --gfa $minnow_ind/dbg.gfa -w ~/minnow/data/737K-august-2016.txt --countProb ~/minnow/data/hg/countProb_pbmc_4k.txt --custom |& stdbuf -oL tr '\r' '\n' > $log_file"
      echo $cmd
      eval $cmd
      
      input_dir="simulation/03_tominnow/simulation_DGE/normal$sample/$type"
      output_dir="simulation/04_minnow_sim/simulation_DGE/normal${sample}_${type}_simulated_reads"
      log_file="simulation/04_minnow_sim/simulation_DGE/minnow_simulate_normal${sample}_${type}.log"
      cmd="$minnow simulate --splatter-mode --g2t $g2t --inputdir $input_dir --PCR 6 -r $minnow_ind/ref_k101_fixed.fa -e 0.01 -p 8 -o $output_dir --dbg --gfa $minnow_ind/dbg.gfa -w ~/minnow/data/737K-august-2016.txt --countProb ~/minnow/data/hg/countProb_pbmc_4k.txt --custom |& stdbuf -oL tr '\r' '\n' > $log_file"
      echo $cmd
      eval $cmd
  done
done