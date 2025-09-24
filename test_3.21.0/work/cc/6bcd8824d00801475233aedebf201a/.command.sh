#!/usr/bin/env bash -C -e -u -o pipefail
gtf2bed \
    genome_gfp.gtf \
    > genome_gfp.bed

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:PREPARE_GENOME:GTF2BED":
    perl: $(echo $(perl --version 2>&1) | sed 's/.*v\(.*\)) built.*/\1/')
END_VERSIONS
