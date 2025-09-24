#!/usr/bin/env bash -C -e -u -o pipefail
printf "%s %s\n" SRR6357076_1.fastq.gz RAP1_IAA_30M_REP1_raw_1.gz SRR6357076_2.fastq.gz RAP1_IAA_30M_REP1_raw_2.gz | while read old_name new_name; do
    [ -f "${new_name}" ] || ln -s $old_name $new_name
done

fastqc \
    --quiet \
    --threads 4 \
    --memory 3840 \
    RAP1_IAA_30M_REP1_raw_1.gz RAP1_IAA_30M_REP1_raw_2.gz

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FASTQ_FASTQC_UMITOOLS_TRIMGALORE:FASTQC":
    fastqc: $( fastqc --version | sed '/FastQC v/!d; s/.*v//' )
END_VERSIONS
