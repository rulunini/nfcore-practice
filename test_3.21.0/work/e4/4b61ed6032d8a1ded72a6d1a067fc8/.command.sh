#!/usr/bin/env bash -C -e -u -o pipefail
fq lint \
    --disable-validator P001 \
    WT_REP1_1.merged.fastq.gz WT_REP1_2.merged.fastq.gz > WT_REP1.fq_lint.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FQ_LINT":
    fq: $(echo $(fq lint --version | sed 's/fq-lint //g'))
END_VERSIONS
