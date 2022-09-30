#!/bin/bash
DATA_DIR=kidney_mouse/03_data/BRIE2
celltypes=("Adipocytes" "Epithelial_cells" "Hepatocytes")

for type in ${celltypes[@]}
  do
    brie-quant -i $DATA_DIR/simulation/cell_info_${type}.h5ad \
    -c $DATA_DIR/simulation/cell_info_${type}.tsv \
    -o $DATA_DIR/simulation/isA_${type}.h5ad \
    --layers=spliced,unspliced \
    --minCell 0 --minCount 0 --minUniqCount 0 --minMIF 0 \
    --interceptMode gene --LRTindex 0
    
    brie-quant -i $DATA_DIR/simulation_DGE/cell_info_${type}.h5ad \
    -c $DATA_DIR/simulation_DGE/cell_info_${type}.tsv \
    -o $DATA_DIR/simulation_DGE/isA_${type}.h5ad \
    --layers=spliced,unspliced \
    --minCell 0 --minCount 0 --minUniqCount 0 --minMIF 0 \
    --interceptMode gene --LRTindex 0
  done
done