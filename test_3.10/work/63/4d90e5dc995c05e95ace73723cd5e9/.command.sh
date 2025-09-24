#!/bin/bash -ue
samtools \
    idxstats \
    --threads 0 \
    RAP1_UNINDUCED_REP1.sorted.bam \
    > RAP1_UNINDUCED_REP1.sorted.bam.idxstats

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:BAM_SORT_STATS_SAMTOOLS:BAM_STATS_SAMTOOLS:SAMTOOLS_IDXSTATS":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
