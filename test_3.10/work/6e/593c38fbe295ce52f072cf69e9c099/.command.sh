#!/bin/bash -ue
samtools \
    index \
    -@ 1 \
     \
    RAP1_UNINDUCED_REP2.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:BAM_SORT_STATS_SAMTOOLS:SAMTOOLS_INDEX":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
