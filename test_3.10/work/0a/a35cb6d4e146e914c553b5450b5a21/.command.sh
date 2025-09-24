#!/bin/bash -ue
featureCounts \
    -B -C -g gene_biotype -t exon \
     \
    -T 2 \
    -a genome_gfp.gtf \
    -s 2 \
    -o RAP1_UNINDUCED_REP2.featureCounts.txt \
    RAP1_UNINDUCED_REP2.markdup.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:SUBREAD_FEATURECOUNTS":
    subread: $( echo $(featureCounts -v 2>&1) | sed -e "s/featureCounts v//g")
END_VERSIONS
