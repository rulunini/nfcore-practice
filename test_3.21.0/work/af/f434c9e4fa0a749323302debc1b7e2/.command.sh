#!/usr/bin/env bash -C -e -u -o pipefail
read_distribution.py \
    -i WT_REP2.markdup.sorted.bam \
    -r genome_gfp.bed \
    > WT_REP2.read_distribution.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_READDISTRIBUTION":
    rseqc: $(read_distribution.py --version | sed -e "s/read_distribution.py //g")
END_VERSIONS
