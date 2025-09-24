#!/usr/bin/env bash -C -e -u -o pipefail
salmon quant \
    --geneMap genome_gfp.gtf \
    --threads 4 \
    --libType=SR \
    --index salmon \
    -r RAP1_UNINDUCED_REP2_primary.fastq.gz \
     \
    -o RAP1_UNINDUCED_REP2

if [ -f RAP1_UNINDUCED_REP2/aux_info/meta_info.json ]; then
    cp RAP1_UNINDUCED_REP2/aux_info/meta_info.json "RAP1_UNINDUCED_REP2_meta_info.json"
fi
if [ -f RAP1_UNINDUCED_REP2/lib_format_counts.json ]; then
    cp RAP1_UNINDUCED_REP2/lib_format_counts.json "RAP1_UNINDUCED_REP2_lib_format_counts.json"
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUANTIFY_PSEUDO_ALIGNMENT:SALMON_QUANT":
    salmon: $(echo $(salmon --version) | sed -e "s/salmon //g")
END_VERSIONS
