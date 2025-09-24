#!/bin/bash -ue
bedGraphToBigWig \
    RAP1_IAA_30M_REP1.clip.forward.bedGraph \
    genome_gfp.fasta.sizes \
    RAP1_IAA_30M_REP1.forward.bigWig

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_FORWARD:UCSC_BEDGRAPHTOBIGWIG":
    ucsc: 377
END_VERSIONS
