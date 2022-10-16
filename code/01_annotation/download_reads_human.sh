#!/bin/bash
human_files=(SRR8869247 SRR8869248 SRR8869249 SRR8869262 SRR8869263 SRR8869264)

for file in ${human_files[@]}
do
	prefetch ${file} --output-directory brain_human/fastq && fasterq-dump brain_human/fastq/${file} -O brain_human/fastq
done