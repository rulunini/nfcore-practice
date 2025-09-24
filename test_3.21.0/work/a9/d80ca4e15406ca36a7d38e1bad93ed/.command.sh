#!/usr/bin/env bash -C -e -u -o pipefail
samtools \
    flagstat \
    --threads 1 \
    WT_REP1.markdup.sorted.bam \
    > WT_REP1.markdup.sorted.bam.flagstat

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_MARKDUPLICATES_PICARD:BAM_STATS_SAMTOOLS:SAMTOOLS_FLAGSTAT":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
