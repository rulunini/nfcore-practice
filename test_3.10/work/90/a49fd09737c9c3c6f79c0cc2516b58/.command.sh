#!/bin/bash -ue
bedtools \
    genomecov \
    -ibam WT_REP1.markdup.sorted.bam \
    -bg \
    -strand + \
    -split -du \
    | bedtools sort > WT_REP1.reverse.bedGraph

bedtools \
    genomecov \
    -ibam WT_REP1.markdup.sorted.bam \
    -bg \
    -strand - \
    -split -du \
    | bedtools sort > WT_REP1.forward.bedGraph

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDTOOLS_GENOMECOV":
    bedtools: $(bedtools --version | sed -e "s/bedtools v//g")
END_VERSIONS
