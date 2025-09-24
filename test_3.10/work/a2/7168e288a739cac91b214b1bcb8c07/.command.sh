#!/bin/bash -ue
samtools \
    index \
    -@ 1 \
     \
    RAP1_IAA_30M_REP1.markdup.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_MARKDUPLICATES_PICARD:SAMTOOLS_INDEX":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
