#!/bin/bash -ue
bedClip \
    RAP1_UNINDUCED_REP2.reverse.bedGraph \
    genome_gfp.fasta.sizes \
    RAP1_UNINDUCED_REP2.clip.reverse.bedGraph

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_REVERSE:UCSC_BEDCLIP":
    ucsc: 377
END_VERSIONS
