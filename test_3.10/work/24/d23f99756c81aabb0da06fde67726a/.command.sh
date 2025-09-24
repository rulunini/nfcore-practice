#!/bin/bash -ue
bedClip \
    WT_REP1.forward.bedGraph \
    genome_gfp.fasta.sizes \
    WT_REP1.clip.forward.bedGraph

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_FORWARD:UCSC_BEDCLIP":
    ucsc: 377
END_VERSIONS
