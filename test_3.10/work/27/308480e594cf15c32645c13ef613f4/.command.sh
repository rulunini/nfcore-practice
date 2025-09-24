#!/bin/bash -ue
bam_stat.py \
    -i RAP1_IAA_30M_REP1.markdup.sorted.bam \
     \
    > RAP1_IAA_30M_REP1.bam_stat.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_BAMSTAT":
    rseqc: $(bam_stat.py --version | sed -e "s/bam_stat.py //g")
END_VERSIONS
