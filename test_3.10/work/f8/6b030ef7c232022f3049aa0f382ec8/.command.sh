#!/bin/bash -ue
junction_annotation.py \
    -i WT_REP2.markdup.sorted.bam \
    -r genome_gfp.bed \
    -o WT_REP2 \
     \
    2> WT_REP2.junction_annotation.log

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_JUNCTIONANNOTATION":
    rseqc: $(junction_annotation.py --version | sed -e "s/junction_annotation.py //g")
END_VERSIONS
