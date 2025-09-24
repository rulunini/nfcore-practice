#!/usr/bin/env bash -C -e -u -o pipefail
samtools \
    idxstats \
    --threads 0 \
    WT_REP1.sorted.bam \
    > WT_REP1.sorted.bam.idxstats

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:BAM_SORT_STATS_SAMTOOLS:BAM_STATS_SAMTOOLS:SAMTOOLS_IDXSTATS":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
