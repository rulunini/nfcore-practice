#!/bin/bash -ue
bedClip \
    RAP1_UNINDUCED_REP1.forward.bedGraph \
    genome_gfp.fasta.sizes \
    RAP1_UNINDUCED_REP1.clip.forward.bedGraph

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_FORWARD:UCSC_BEDCLIP":
    ucsc: 377
END_VERSIONS
