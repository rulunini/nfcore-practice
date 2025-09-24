#!/usr/bin/env bash -C -e -u -o pipefail
samtools cat \
    WT_REP1.Aligned.out.bam \
| \
samtools sort \
     \
    -T WT_REP1.sorted \
    --threads 4 \
    --reference genome_gfp.fasta \
    -o WT_REP1.sorted.bam \
    -

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:BAM_SORT_STATS_SAMTOOLS:SAMTOOLS_SORT":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
