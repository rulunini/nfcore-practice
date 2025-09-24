#!/bin/bash -ue
read_duplication.py \
    -i RAP1_UNINDUCED_REP2.markdup.sorted.bam \
    -o RAP1_UNINDUCED_REP2 \


cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_READDUPLICATION":
    rseqc: $(read_duplication.py --version | sed -e "s/read_duplication.py //g")
END_VERSIONS
