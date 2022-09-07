#!/bin/bash

## Mouse kidney samples
: << 'COMMENT'
mouse_files=(SRR6337197 SRR6337198 SRR6337199 SRR6337200 SRR6337201 SRR6337202 SRR6337203 SRR6337204 SRR6337205 SRR6337206 SRR6337207 SRR6337208 SRR6337209 SRR6337210 SRR6337211 SRR6337212 SRR6337213 SRR6337214 SRR6337215 SRR6337216 SRR6337217 SRR6337218 SRR6337219 SRR6337220 SRR6337221 SRR6337222 SRR6337223 SRR6337224 SRR6337225 SRR6337226 SRR6337227 SRR6337228)
COMMENT

mouse_files=(SRR6337197 SRR6337198 SRR6337199 SRR6337200 SRR6337201 SRR6337202 SRR6337203 SRR6337204)

for file in ${mouse_files[@]}
do
	prefetch ${file} && fasterq-dump ${file}
done

: << 'COMMENT'
## Human brain organoids

wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869247/Org1_possorted_genome_bam.bam.1 -O SRR8869247.bam && \ 
bamtofastq SRR8869247.bam SRR8869247 --nthreads=32 && rm -rf SRR8869247.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869248/Org2_possorted_genome_bam.bam.1 -O SRR8869248.bam && \
bamtofastq SRR8869248.bam SRR8869248 --nthreads=32 && rm -rf SRR8869248.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869249/Org3_possorted_genome_bam.bam.1 -O SRR8869249.bam && \
bamtofastq SRR8869249.bam SRR8869249 --nthreads=32 && rm -rf SRR8869249.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869250/Org4_possorted_genome_bam.bam.1 -O SRR8869250.bam && \
bamtofastq SRR8869250.bam SRR8869250 --nthreads=32 && rm -rf SRR8869250.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869251/Org5_possorted_genome_bam.bam.1 -O SRR8869251.bam && \
bamtofastq SRR8869251.bam SRR8869251 --nthreads=32 && rm -rf SRR8869251.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869252/Org6_possorted_genome_bam.bam.1 -O SRR8869252.bam && \
bamtofastq SRR8869252.bam SRR8869252 --nthreads=32 && rm -rf SRR8869252.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869262/Org16_possorted_genome_bam.bam.1 -O SRR8869262.bam && \
bamtofastq SRR8869262.bam SRR8869262 --nthreads=32 && rm -rf SRR8869262.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869263/Org17_possorted_genome_bam.bam.1 -O SRR8869263.bam && \
bamtofastq SRR8869263.bam SRR8869263 --nthreads=32 && rm -rf SRR8869263.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869264/Org18_possorted_genome_bam.bam.1 -O SRR8869264.bam && \
bamtofastq SRR8869264.bam SRR8869264 --nthreads=32 && rm -rf SRR8869264.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869265/Org19_possorted_genome_bam.bam.1 -O SRR8869265.bam && \
bamtofastq SRR8869265.bam SRR8869265 --nthreads=32 && rm -rf SRR8869265.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869266/Org20_possorted_genome_bam.bam.1 -O SRR8869266.bam && \
bamtofastq SRR8869266.bam SRR8869266 --nthreads=32 && rm -rf SRR8869266.bam
wget https://sra-pub-src-1.s3.amazonaws.com/SRR8869267/Org21_possorted_genome_bam.bam.1 -O SRR8869267.bam && \
bamtofastq SRR8869267.bam SRR8869267 --nthreads=32 && rm -rf SRR8869267.bam
COMMENT
