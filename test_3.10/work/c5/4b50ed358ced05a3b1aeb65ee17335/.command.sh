#!/bin/bash -ue
salmon quant \
    --geneMap genome_gfp.gtf \
    --threads 2 \
    --libType=ISR \
    --index salmon \
    -1 WT_REP2_primary_1.fastq.gz -2 WT_REP2_primary_2.fastq.gz \
     \
    -o WT_REP2

if [ -f WT_REP2/aux_info/meta_info.json ]; then
    cp WT_REP2/aux_info/meta_info.json "WT_REP2_meta_info.json"
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUANTIFY_SALMON:SALMON_QUANT":
    salmon: $(echo $(salmon --version) | sed -e "s/salmon //g")
END_VERSIONS
