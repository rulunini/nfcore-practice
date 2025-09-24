#!/bin/bash -ue
dupradar.r \
    RAP1_UNINDUCED_REP1.markdup.sorted.bam \
    RAP1_UNINDUCED_REP1 \
    genome_gfp.gtf \
    2 \
    single \
    1

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:DUPRADAR":
    r-base: $(echo $(R --version 2>&1) | sed 's/^.*R version //; s/ .*$//')
    bioconductor-dupradar: $(Rscript -e "library(dupRadar); cat(as.character(packageVersion('dupRadar')))")
END_VERSIONS
