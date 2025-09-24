#!/usr/bin/env bash -C -e -u -o pipefail
[ ! -f  RAP1_UNINDUCED_REP2_trimmed.fastq.gz ] && ln -s RAP1_UNINDUCED_REP2.merged.fastq.gz RAP1_UNINDUCED_REP2_trimmed.fastq.gz
trim_galore \
    --fastqc_args '-t 4' \
    --cores 1 \
    --gzip \
    RAP1_UNINDUCED_REP2_trimmed.fastq.gz

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FASTQ_FASTQC_UMITOOLS_TRIMGALORE:TRIMGALORE":
    trimgalore: $(echo $(trim_galore --version 2>&1) | sed 's/^.*version //; s/Last.*$//')
    cutadapt: $(cutadapt --version)
    pigz: $( pigz --version 2>&1 | sed 's/pigz //g' )
END_VERSIONS
