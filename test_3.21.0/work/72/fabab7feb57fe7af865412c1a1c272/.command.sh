#!/usr/bin/env bash -C -e -u -o pipefail
salmon quant \
    --geneMap genome_gfp.gtf \
    --threads 4 \
    --libType=A \
    --index salmon \
    -1 WT_REP1.subsampled_R1.fastq.gz -2 WT_REP1.subsampled_R2.fastq.gz \
    --skipQuant \
    -o WT_REP1

if [ -f WT_REP1/aux_info/meta_info.json ]; then
    cp WT_REP1/aux_info/meta_info.json "WT_REP1_meta_info.json"
fi
if [ -f WT_REP1/lib_format_counts.json ]; then
    cp WT_REP1/lib_format_counts.json "WT_REP1_lib_format_counts.json"
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FASTQ_SUBSAMPLE_FQ_SALMON:SALMON_QUANT":
    salmon: $(echo $(salmon --version) | sed -e "s/salmon //g")
END_VERSIONS
