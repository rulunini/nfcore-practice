#!/usr/bin/env bash -C -e -u -o pipefail
featureCounts \
    -B -C -g gene_biotype -t exon \
    -p \
    -T 4 \
    -a genome_gfp.gtf \
    -s 2 \
    -o WT_REP1.featureCounts.tsv \
    WT_REP1.markdup.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:SUBREAD_FEATURECOUNTS":
    subread: $( echo $(featureCounts -v 2>&1) | sed -e "s/featureCounts v//g")
END_VERSIONS
