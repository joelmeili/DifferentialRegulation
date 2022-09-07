#!/bin/bash
salmon index \
-t brain_human/01_annotation/splici/transcriptome_splici.fa \
-i brain_human/01_annotation/splici/index_folder \
--gencode -p 32

## ORGANOID 1
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869247/s1_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid1/ -p 32 --chromium --sketch

## ORGANOID 2
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869248/s2_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid2/ -p 32 --chromium --sketch

## ORGANOID 3
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_H7WTJBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HFM7TBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HHT33BGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869249/s3_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid3/ -p 32 --chromium --sketch

## ORGANOID 4
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869250/s1_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid4/ -p 32 --chromium --sketch

## ORGANOID 5
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869251/s2_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid5/ -p 32 --chromium --sketch

## ORGANOID 6
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869252/s3_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid6/ -p 32 --chromium --sketch

## ORGANOID 16
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L002_R1_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L003_R1_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R1_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R1_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R1_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R1_002.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L002_R2_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L003_R2_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R2_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R2_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R2_002.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869262/s4_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R2_002.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid16/ -p 32 --chromium --sketch

## ORGANOID 17
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869263/s5_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid17/ -p 32 --chromium --sketch

## ORGANOID 18
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HMWNVBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869264/s6_MissingLibrary_1_HTW2HBGX5/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid18/ -p 32 --chromium --sketch

## ORGANOID 19
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869265/s4_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid19/ -p 32 --chromium --sketch

## ORGANOID 20
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869266/s5_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid20/ -p 32 --chromium --sketch

## ORGANOID 21
salmon alevin -l ISR -i brain_human/01_annotation/splici/index_folder \
-1 brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R1_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R1_001.fastq.gz \
-2 brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H2CNKBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H3VLYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27TYBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H27WHBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L001_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L002_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L003_R2_001.fastq.gz \
brain_human/03_data/fastq/SRR8869267/s6_MissingLibrary_1_H235HBGX9/bamtofastq_S1_L004_R2_001.fastq.gz \
-o brain_human/02_alevin_for_fry/organoid21/ -p 32 --chromium --sketch
