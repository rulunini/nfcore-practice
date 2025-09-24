#!/usr/bin/env bash -C -e -u -o pipefail
cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_INNERDISTANCE":
    rseqc: $(inner_distance.py --version | sed -e "s/inner_distance.py //g")
END_VERSIONS
