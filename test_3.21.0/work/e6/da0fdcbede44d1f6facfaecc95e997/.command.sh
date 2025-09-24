#!/usr/bin/env bash -C -e -u -o pipefail
junction_annotation.py \
    -i WT_REP2.markdup.sorted.bam \
    -r genome_gfp.bed \
    -o WT_REP2 \
     \
    2>| >(grep -v 'E::idx_find_and_load' | tee WT_REP2.junction_annotation.log >&2)

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_JUNCTIONANNOTATION":
    rseqc: $(junction_annotation.py --version | sed -e "s/junction_annotation.py //g")
END_VERSIONS
