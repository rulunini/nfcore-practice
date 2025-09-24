#!/bin/bash -ue
infer_experiment.py \
    -i RAP1_UNINDUCED_REP1.markdup.sorted.bam \
    -r genome_gfp.bed \
     \
    > RAP1_UNINDUCED_REP1.infer_experiment.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:BAM_RSEQC:RSEQC_INFEREXPERIMENT":
    rseqc: $(infer_experiment.py --version | sed -e "s/infer_experiment.py //g")
END_VERSIONS
