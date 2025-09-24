#!/usr/bin/env bash -C -e -u -o pipefail
samtools cat \
    RAP1_IAA_30M_REP1.Aligned.out.bam \
| \
samtools sort \
     \
    -T RAP1_IAA_30M_REP1.sorted \
    --threads 4 \
    --reference genome_gfp.fasta \
    -o RAP1_IAA_30M_REP1.sorted.bam \
    -

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:BAM_SORT_STATS_SAMTOOLS:SAMTOOLS_SORT":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
