#!/bin/bash -ue
stringtie \
    WT_REP1.markdup.sorted.bam \
    --rf \
    -G genome_gfp.gtf \
    -o WT_REP1.transcripts.gtf \
    -A WT_REP1.gene.abundance.txt \
    -C WT_REP1.coverage.gtf \
    -b WT_REP1.ballgown \
    -p 2 \
    -v -e

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:STRINGTIE_STRINGTIE":
    stringtie: $(stringtie --version 2>&1)
END_VERSIONS
