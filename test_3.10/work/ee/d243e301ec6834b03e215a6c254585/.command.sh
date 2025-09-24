#!/bin/bash -ue
bedGraphToBigWig \
    RAP1_UNINDUCED_REP1.clip.reverse.bedGraph \
    genome_gfp.fasta.sizes \
    RAP1_UNINDUCED_REP1.reverse.bigWig

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_REVERSE:UCSC_BEDGRAPHTOBIGWIG":
    ucsc: 377
END_VERSIONS
