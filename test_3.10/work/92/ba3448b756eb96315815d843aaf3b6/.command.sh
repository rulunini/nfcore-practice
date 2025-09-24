#!/bin/bash -ue
samtools sort  -@ 2 -o RAP1_UNINDUCED_REP2.sorted.bam -T RAP1_UNINDUCED_REP2.sorted RAP1_UNINDUCED_REP2.Aligned.out.bam
cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:BAM_SORT_STATS_SAMTOOLS:SAMTOOLS_SORT":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
