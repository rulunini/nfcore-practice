#!/usr/bin/env bash -C -e -u -o pipefail
stringtie \
    RAP1_UNINDUCED_REP2.markdup.sorted.bam \
    --rf \
    -G genome_gfp.gtf \
    -o RAP1_UNINDUCED_REP2.transcripts.gtf \
    -A RAP1_UNINDUCED_REP2.gene.abundance.txt \
    -C RAP1_UNINDUCED_REP2.coverage.gtf \
    -b RAP1_UNINDUCED_REP2.ballgown \
    -p 4 \
    -v -e

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:STRINGTIE_STRINGTIE":
    stringtie: $(stringtie --version 2>&1)
END_VERSIONS
