#!/bin/bash
DATA_DIR=kidney_mouse/03_data/BRIE2

groups=("1" "2" "3")
celltypes=("Adipocytes" "B_cells" "Cardiomyocytes" "Endothelial_cells" "Epithelial_cells" "Erythrocytes"
 "Fibroblasts" "Hepatocytes" "Macrophages" "Monocytes" "Neurons" "NK_cells" "T_cells")

for group in ${groups[@]}
  do
    for type in ${celltypes[@]}
    do
      brie-quant -i $DATA_DIR/GROUP${group}/cell_info_${type}.h5ad \
      -c $DATA_DIR/GROUP${group}/cell_info_${type}.tsv \
      -o $DATA_DIR/GROUP${group}/isA_${type}.h5ad \
      --layers=spliced,unspliced \
      --minCell 0 --minCount 0 --minUniqCount 0 --minMIF 0 \
      --interceptMode gene --LRTindex 0
    done
done