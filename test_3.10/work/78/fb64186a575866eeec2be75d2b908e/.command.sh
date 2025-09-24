#!/bin/bash -ue
bedGraphToBigWig \
    WT_REP2.clip.forward.bedGraph \
    genome_gfp.fasta.sizes \
    WT_REP2.forward.bigWig

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_FORWARD:UCSC_BEDGRAPHTOBIGWIG":
    ucsc: 377
END_VERSIONS
