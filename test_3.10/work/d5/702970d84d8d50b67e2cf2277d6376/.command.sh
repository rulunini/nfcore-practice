#!/bin/bash -ue
salmon quant \
    --geneMap genome_gfp.gtf \
    --threads 2 \
    --libType=SR \
    --index salmon \
    -r RAP1_UNINDUCED_REP2_primary.fastq.gz \
     \
    -o RAP1_UNINDUCED_REP2

if [ -f RAP1_UNINDUCED_REP2/aux_info/meta_info.json ]; then
    cp RAP1_UNINDUCED_REP2/aux_info/meta_info.json "RAP1_UNINDUCED_REP2_meta_info.json"
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUANTIFY_SALMON:SALMON_QUANT":
    salmon: $(echo $(salmon --version) | sed -e "s/salmon //g")
END_VERSIONS
