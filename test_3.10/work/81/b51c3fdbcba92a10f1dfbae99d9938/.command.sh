#!/bin/bash -ue
dupradar.r \
    WT_REP2.markdup.sorted.bam \
    WT_REP2 \
    genome_gfp.gtf \
    2 \
    paired \
    1

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:DUPRADAR":
    r-base: $(echo $(R --version 2>&1) | sed 's/^.*R version //; s/ .*$//')
    bioconductor-dupradar: $(Rscript -e "library(dupRadar); cat(as.character(packageVersion('dupRadar')))")
END_VERSIONS
