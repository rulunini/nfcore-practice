#!/usr/bin/env bash -C -e -u -o pipefail
bedClip \
    WT_REP2.forward.bedGraph \
    genome_gfp.fasta.sizes \
    WT_REP2.clip.reverse.bedGraph

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_REVERSE:UCSC_BEDCLIP":
    ucsc: 377
END_VERSIONS
