#!/bin/bash -ue
salmon quant \
    --geneMap genome_gfp.gtf \
    --threads 2 \
    --libType=ISR \
    --index salmon \
    -1 RAP1_IAA_30M_REP1_primary_1.fastq.gz -2 RAP1_IAA_30M_REP1_primary_2.fastq.gz \
     \
    -o RAP1_IAA_30M_REP1

if [ -f RAP1_IAA_30M_REP1/aux_info/meta_info.json ]; then
    cp RAP1_IAA_30M_REP1/aux_info/meta_info.json "RAP1_IAA_30M_REP1_meta_info.json"
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUANTIFY_SALMON:SALMON_QUANT":
    salmon: $(echo $(salmon --version) | sed -e "s/salmon //g")
END_VERSIONS
