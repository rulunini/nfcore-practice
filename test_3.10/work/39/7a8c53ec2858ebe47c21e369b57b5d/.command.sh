#!/bin/bash -ue
cut -f 1,7 WT_REP2.featureCounts.txt | tail -n +3 | cat biotypes_header.txt - >> WT_REP2.biotype_counts_mqc.tsv

mqc_features_stat.py \
    WT_REP2.biotype_counts_mqc.tsv \
    -s WT_REP2 \
    -f rRNA \
    -o WT_REP2.biotype_counts_rrna_mqc.tsv

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:MULTIQC_CUSTOM_BIOTYPE":
    python: $(python --version | sed 's/Python //g')
END_VERSIONS
