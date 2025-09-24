#!/usr/bin/env bash -C -e -u -o pipefail
printf "%s %s\n" WT_REP1_1.merged.fastq.gz WT_REP1_raw_1.gz WT_REP1_2.merged.fastq.gz WT_REP1_raw_2.gz | while read old_name new_name; do
    [ -f "${new_name}" ] || ln -s $old_name $new_name
done

fastqc \
    --quiet \
    --threads 4 \
    --memory 3840 \
    WT_REP1_raw_1.gz WT_REP1_raw_2.gz

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FASTQ_FASTQC_UMITOOLS_TRIMGALORE:FASTQC":
    fastqc: $( fastqc --version | sed '/FastQC v/!d; s/.*v//' )
END_VERSIONS
