#!/usr/bin/env bash -C -e -u -o pipefail
junction_saturation.py \
    -i RAP1_UNINDUCED_REP1.markdup.sorted.bam \
    -r genome_gfp.bed \
    -o RAP1_UNINDUCED_REP1 \


cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_JUNCTIONSATURATION":
    rseqc: $(junction_saturation.py --version | sed -e "s/junction_saturation.py //g")
END_VERSIONS
