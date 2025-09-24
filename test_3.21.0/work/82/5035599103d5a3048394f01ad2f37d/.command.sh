#!/usr/bin/env bash -C -e -u -o pipefail
salmon quant \
    --geneMap genome_gfp.gtf \
    --threads 4 \
    --libType=ISR \
    -t transcriptome.fasta \
    -a WT_REP2.Aligned.toTranscriptome.out.bam \
     \
    -o WT_REP2

if [ -f WT_REP2/aux_info/meta_info.json ]; then
    cp WT_REP2/aux_info/meta_info.json "WT_REP2_meta_info.json"
fi
if [ -f WT_REP2/lib_format_counts.json ]; then
    cp WT_REP2/lib_format_counts.json "WT_REP2_lib_format_counts.json"
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUANTIFY_STAR_SALMON:SALMON_QUANT":
    salmon: $(echo $(salmon --version) | sed -e "s/salmon //g")
END_VERSIONS
