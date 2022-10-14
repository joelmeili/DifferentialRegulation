#!/bin/bash
DATA_DIR=kidney_mouse/03_data/null/BRIE2
celltypes=("Adipocytes" "Epithelial_cells" "Hepatocytes")

for type in ${celltypes[@]}
do
  brie-quant -i $DATA_DIR/cell_info_${type}.h5ad \
  -c $DATA_DIR/cell_info_${type}.tsv \
  -o $DATA_DIR/isA_${type}.h5ad \
  --layers=spliced,unspliced \
  --minCell 0 --minCount 0 --minUniqCount 0 --minMIF 0 \
  --interceptMode gene --LRTindex 0
done