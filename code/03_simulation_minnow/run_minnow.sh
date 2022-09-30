#!/bin/bash
minnow index -r kidney_mouse/01_annotation/splici/transcriptome_splici.fa -k 101 -f 20 \
--tmpdir kidney_mouse/04_simulation/tmp -p 8 \
-o kidney_mouse/04_simulation/minnow_ind |& stdbuf -oL tr '\r' '\n' > \
kidney_mouse/04_simulation/minnow_index.log