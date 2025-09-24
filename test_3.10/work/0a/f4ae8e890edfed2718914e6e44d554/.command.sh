#!/bin/bash -ue
picard \
    -Xmx6g \
    MarkDuplicates \
    --ASSUME_SORTED true --REMOVE_DUPLICATES false --VALIDATION_STRINGENCY LENIENT --TMP_DIR tmp \
    --INPUT RAP1_UNINDUCED_REP2.sorted.bam \
    --OUTPUT RAP1_UNINDUCED_REP2.markdup.sorted.bam \
    --REFERENCE_SEQUENCE genome_gfp.fasta \
    --METRICS_FILE RAP1_UNINDUCED_REP2.markdup.sorted.MarkDuplicates.metrics.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_MARKDUPLICATES_PICARD:PICARD_MARKDUPLICATES":
    picard: $(echo $(picard MarkDuplicates --version 2>&1) | grep -o 'Version:.*' | cut -f2- -d:)
END_VERSIONS
