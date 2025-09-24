#!/usr/bin/env bash -C -e -u -o pipefail
bedClip \
    RAP1_IAA_30M_REP1.forward.bedGraph \
    genome_gfp.fasta.sizes \
    RAP1_IAA_30M_REP1.clip.reverse.bedGraph

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_REVERSE:UCSC_BEDCLIP":
    ucsc: 377
END_VERSIONS
