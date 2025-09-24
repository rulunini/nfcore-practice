#!/usr/bin/env bash -C -e -u -o pipefail
bedGraphToBigWig \
    WT_REP2.clip.reverse.bedGraph \
    genome_gfp.fasta.sizes \
    WT_REP2.reverse.bigWig

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_REVERSE:UCSC_BEDGRAPHTOBIGWIG":
    ucsc: 469
END_VERSIONS
