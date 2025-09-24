#!/bin/bash -ue
junction_saturation.py \
    -i RAP1_IAA_30M_REP1.markdup.sorted.bam \
    -r genome_gfp.bed \
    -o RAP1_IAA_30M_REP1 \


cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_JUNCTIONSATURATION":
    rseqc: $(junction_saturation.py --version | sed -e "s/junction_saturation.py //g")
END_VERSIONS
