#!/usr/bin/env bash -C -e -u -o pipefail
[ ! -f  RAP1_IAA_30M_REP1_trimmed_1.fastq.gz ] && ln -s SRR6357076_1.fastq.gz RAP1_IAA_30M_REP1_trimmed_1.fastq.gz
[ ! -f  RAP1_IAA_30M_REP1_trimmed_2.fastq.gz ] && ln -s SRR6357076_2.fastq.gz RAP1_IAA_30M_REP1_trimmed_2.fastq.gz
trim_galore \
    --fastqc_args '-t 4' \
    --cores 1 \
    --paired \
    --gzip \
    RAP1_IAA_30M_REP1_trimmed_1.fastq.gz \
    RAP1_IAA_30M_REP1_trimmed_2.fastq.gz

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FASTQ_FASTQC_UMITOOLS_TRIMGALORE:TRIMGALORE":
    trimgalore: $(echo $(trim_galore --version 2>&1) | sed 's/^.*version //; s/Last.*$//')
    cutadapt: $(cutadapt --version)
    pigz: $( pigz --version 2>&1 | sed 's/pigz //g' )
END_VERSIONS
