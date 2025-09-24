#!/bin/bash -ue
junction_annotation.py \
    -i RAP1_IAA_30M_REP1.markdup.sorted.bam \
    -r genome_gfp.bed \
    -o RAP1_IAA_30M_REP1 \
     \
    2> RAP1_IAA_30M_REP1.junction_annotation.log

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_JUNCTIONANNOTATION":
    rseqc: $(junction_annotation.py --version | sed -e "s/junction_annotation.py //g")
END_VERSIONS
