#!/bin/bash -ue
read_distribution.py \
    -i RAP1_IAA_30M_REP1.markdup.sorted.bam \
    -r genome_gfp.bed \
    > RAP1_IAA_30M_REP1.read_distribution.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_READDISTRIBUTION":
    rseqc: $(read_distribution.py --version | sed -e "s/read_distribution.py //g")
END_VERSIONS
