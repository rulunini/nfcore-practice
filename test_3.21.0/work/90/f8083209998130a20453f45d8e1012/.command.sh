#!/usr/bin/env bash -C -e -u -o pipefail
cut -f 1,7 WT_REP1.featureCounts.tsv | tail -n +3 | cat biotypes_header.txt - >> WT_REP1.biotype_counts_mqc.tsv

mqc_features_stat.py \
    WT_REP1.biotype_counts_mqc.tsv \
    -s WT_REP1 \
    -f rRNA \
    -o WT_REP1.biotype_counts_rrna_mqc.tsv

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:MULTIQC_CUSTOM_BIOTYPE":
    python: $(python --version | sed 's/Python //g')
END_VERSIONS
