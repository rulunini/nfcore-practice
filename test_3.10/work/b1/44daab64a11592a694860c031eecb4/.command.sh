#!/bin/bash -ue
samtools \
    stats \
    --threads 1 \
    --reference genome_gfp.fasta \
    WT_REP2.sorted.bam \
    > WT_REP2.sorted.bam.stats

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:BAM_SORT_STATS_SAMTOOLS:BAM_STATS_SAMTOOLS:SAMTOOLS_STATS":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
