#!/bin/bash -ue
multiqc \
    -f \
     \
     \
    .

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:MULTIQC":
    multiqc: $( multiqc --version | sed -e "s/multiqc, version //g" )
END_VERSIONS
