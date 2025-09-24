#!/bin/bash -ue
samtools \
    index \
    -@ 1 \
     \
    RAP1_IAA_30M_REP1.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:BAM_SORT_STATS_SAMTOOLS:SAMTOOLS_INDEX":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
