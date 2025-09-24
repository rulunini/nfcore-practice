#!/usr/bin/env bash -C -e -u -o pipefail
multiqc \
    --force \
     \
    --config multiqc_config.yml \
    --filename multiqc_report.html \
     \
     \
    --replace-names name_replacement.txt \
     \
    .

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:MULTIQC":
    multiqc: $( multiqc --version | sed -e "s/multiqc, version //g" )
END_VERSIONS
