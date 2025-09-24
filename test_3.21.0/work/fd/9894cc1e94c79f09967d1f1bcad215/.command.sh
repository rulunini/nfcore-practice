#!/usr/bin/env bash -C -e -u -o pipefail
inner_distance.py \
    -i WT_REP1.markdup.sorted.bam \
    -r genome_gfp.bed \
    -o WT_REP1 \
     \
    > stdout.txt
head -n 2 stdout.txt > WT_REP1.inner_distance_mean.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_INNERDISTANCE":
    rseqc: $(inner_distance.py --version | sed -e "s/inner_distance.py //g")
END_VERSIONS
