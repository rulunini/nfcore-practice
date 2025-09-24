#!/bin/bash -ue
salmon_tx2gene.py \
    --gtf genome_gfp.gtf \
    --salmon salmon \
    --id gene_id \
    --extra gene_name \
    -o salmon_tx2gene.tsv

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUANTIFY_SALMON:SALMON_TX2GENE":
    python: $(python --version | sed 's/Python //g')
END_VERSIONS
