#!/usr/bin/env bash -C -e -u -o pipefail
bedGraphToBigWig \
    RAP1_IAA_30M_REP1.clip.reverse.bedGraph \
    genome_gfp.fasta.sizes \
    RAP1_IAA_30M_REP1.reverse.bigWig

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_REVERSE:UCSC_BEDGRAPHTOBIGWIG":
    ucsc: 469
END_VERSIONS
