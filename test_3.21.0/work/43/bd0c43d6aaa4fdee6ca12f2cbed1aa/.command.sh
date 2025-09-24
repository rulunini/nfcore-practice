#!/usr/bin/env bash -C -e -u -o pipefail
bedGraphToBigWig \
    WT_REP1.clip.forward.bedGraph \
    genome_gfp.fasta.sizes \
    WT_REP1.forward.bigWig

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BEDGRAPH_BEDCLIP_BEDGRAPHTOBIGWIG_FORWARD:UCSC_BEDGRAPHTOBIGWIG":
    ucsc: 469
END_VERSIONS
