#!/usr/bin/env bash -C -e -u -o pipefail
bedtools \
    genomecov \
    -ibam RAP1_UNINDUCED_REP1.markdup.sorted.bam \
    -split -du -strand - -bg \
    | LC_ALL=C sort --parallel=1 --buffer-size=3G -k1,1 -k2,2n \
    > RAP1_UNINDUCED_REP1.forward.bedGraph

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDTOOLS_GENOMECOV_REV":
    bedtools: $(bedtools --version | sed -e "s/bedtools v//g")
END_VERSIONS
