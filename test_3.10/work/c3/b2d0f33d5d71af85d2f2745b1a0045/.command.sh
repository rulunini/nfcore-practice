#!/bin/bash -ue
samtools \
    stats \
    --threads 1 \
    --reference genome_gfp.fasta \
    RAP1_IAA_30M_REP1.markdup.sorted.bam \
    > RAP1_IAA_30M_REP1.markdup.sorted.bam.stats

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_MARKDUPLICATES_PICARD:BAM_STATS_SAMTOOLS:SAMTOOLS_STATS":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
