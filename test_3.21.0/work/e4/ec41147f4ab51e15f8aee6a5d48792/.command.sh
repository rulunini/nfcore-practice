#!/usr/bin/env bash -C -e -u -o pipefail
fq lint \
    --disable-validator P001 \
    WT_REP2_trimmed_1_val_1.fq.gz WT_REP2_trimmed_2_val_2.fq.gz > WT_REP2.fq_lint.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FQ_LINT_AFTER_TRIMMING":
    fq: $(echo $(fq lint --version | sed 's/fq-lint //g'))
END_VERSIONS
