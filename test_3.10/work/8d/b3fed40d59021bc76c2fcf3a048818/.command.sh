#!/bin/bash -ue
unset DISPLAY
mkdir tmp
export _JAVA_OPTIONS=-Djava.io.tmpdir=./tmp
qualimap \
    --java-mem-size=6G \
    rnaseq \
     \
    -bam RAP1_IAA_30M_REP1.markdup.sorted.bam \
    -gtf genome_gfp.gtf \
    -p strand-specific-reverse \
    -pe \
    -outdir RAP1_IAA_30M_REP1

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:QUALIMAP_RNASEQ":
    qualimap: $(echo $(qualimap 2>&1) | sed 's/^.*QualiMap v.//; s/Built.*$//')
END_VERSIONS
