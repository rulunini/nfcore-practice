#!/usr/bin/env bash -C -e -u -o pipefail
samtools \
    flagstat \
    --threads 1 \
    RAP1_UNINDUCED_REP1.sorted.bam \
    > RAP1_UNINDUCED_REP1.sorted.bam.flagstat

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:BAM_SORT_STATS_SAMTOOLS:BAM_STATS_SAMTOOLS:SAMTOOLS_FLAGSTAT":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
