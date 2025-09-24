#!/bin/bash -ue
salmon_tximport.r \
    NULL \
    salmon \
    salmon.merged

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUANTIFY_SALMON:SALMON_TXIMPORT":
    r-base: $(echo $(R --version 2>&1) | sed 's/^.*R version //; s/ .*$//')
    bioconductor-tximeta: $(Rscript -e "library(tximeta); cat(as.character(packageVersion('tximeta')))")
END_VERSIONS
