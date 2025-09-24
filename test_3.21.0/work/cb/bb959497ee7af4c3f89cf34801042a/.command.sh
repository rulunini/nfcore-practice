#!/usr/bin/env bash -C -e -u -o pipefail
fq subsample \
    --record-count 1000000 --seed 1 \
    WT_REP1_primary_1.fastq.gz WT_REP1_primary_2.fastq.gz \
    --r1-dst WT_REP1.subsampled_R1.fastq.gz \
    --r2-dst WT_REP1.subsampled_R2.fastq.gz

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FASTQ_SUBSAMPLE_FQ_SALMON:FQ_SUBSAMPLE":
    fq: $(echo $(fq subsample --version | sed 's/fq-subsample //g'))
END_VERSIONS
