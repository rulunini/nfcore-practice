#!/bin/bash -ue
salmon_summarizedexperiment.r \
    NULL \
    salmon.merged.gene_counts.tsv \
    salmon.merged.gene_tpm.tsv

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUANTIFY_STAR_SALMON:SALMON_SE_GENE":
    r-base: $(echo $(R --version 2>&1) | sed 's/^.*R version //; s/ .*$//')
    bioconductor-summarizedexperiment: $(Rscript -e "library(SummarizedExperiment); cat(as.character(packageVersion('SummarizedExperiment')))")
END_VERSIONS
