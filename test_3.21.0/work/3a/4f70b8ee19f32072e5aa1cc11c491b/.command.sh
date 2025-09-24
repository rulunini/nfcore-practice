#!/usr/bin/env bash -C -e -u -o pipefail
fq lint \
    --disable-validator P001 \
    RAP1_UNINDUCED_REP2_primary.fastq.gz > RAP1_UNINDUCED_REP2.fq_lint.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FQ_LINT_AFTER_BBSPLIT":
    fq: $(echo $(fq lint --version | sed 's/fq-lint //g'))
END_VERSIONS
