#!/usr/bin/env bash -C -e -u -o pipefail
deseq2_qc.r \
    --count_file salmon.merged.gene_counts_length_scaled.tsv \
    --outdir ./ \
    --cores 4 \
    --outprefix deseq2 \
    --id_col 1 --sample_suffix '' --count_col 3 --vst TRUE

if [ -f "R_sessionInfo.log" ]; then
    # Handle PCA files
    sed "s/deseq2_pca/star_salmon_deseq2_pca/g" <deseq2_pca_header.txt > pca_header.tmp
    sed -i -e "s/DESeq2 PCA/STAR_SALMON DESeq2 PCA/g" pca_header.tmp
    cat pca_header.tmp *.pca.vals.txt > star_salmon.pca.vals_mqc.tsv
    rm pca_header.tmp

    # Handle clustering files
    sed "s/deseq2_clustering/star_salmon_deseq2_clustering/g" <deseq2_clustering_header.txt > clustering_header.tmp
    sed -i -e "s/DESeq2 sample/STAR_SALMON DESeq2 sample/g" clustering_header.tmp
    cat clustering_header.tmp *.sample.dists.txt > star_salmon.sample.dists_mqc.tsv
    rm clustering_header.tmp
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:DESEQ2_QC_STAR_SALMON":
    r-base: $(echo $(R --version 2>&1) | sed 's/^.*R version //; s/ .*$//')
    bioconductor-deseq2: $(Rscript -e "library(DESeq2); cat(as.character(packageVersion('DESeq2')))")
END_VERSIONS
