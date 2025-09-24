#!/usr/bin/env bash -C -e -u -o pipefail
salmon quant \
    --geneMap genome_gfp.gtf \
    --threads 4 \
    --libType=ISR \
    --index salmon \
    -1 RAP1_IAA_30M_REP1_primary_1.fastq.gz -2 RAP1_IAA_30M_REP1_primary_2.fastq.gz \
     \
    -o RAP1_IAA_30M_REP1

if [ -f RAP1_IAA_30M_REP1/aux_info/meta_info.json ]; then
    cp RAP1_IAA_30M_REP1/aux_info/meta_info.json "RAP1_IAA_30M_REP1_meta_info.json"
fi
if [ -f RAP1_IAA_30M_REP1/lib_format_counts.json ]; then
    cp RAP1_IAA_30M_REP1/lib_format_counts.json "RAP1_IAA_30M_REP1_lib_format_counts.json"
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUANTIFY_PSEUDO_ALIGNMENT:SALMON_QUANT":
    salmon: $(echo $(salmon --version) | sed -e "s/salmon //g")
END_VERSIONS
