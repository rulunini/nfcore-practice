#!/usr/bin/env bash -C -e -u -o pipefail
STAR \
    --genomeDir star \
    --readFilesIn input1/RAP1_IAA_30M_REP1_primary_1.fastq.gz input2/RAP1_IAA_30M_REP1_primary_2.fastq.gz \
    --runThreadN 4 \
    --outFileNamePrefix RAP1_IAA_30M_REP1. \
     \
    --sjdbGTFfile genome_gfp.gtf \
    --outSAMattrRGline 'ID:RAP1_IAA_30M_REP1'  'SM:RAP1_IAA_30M_REP1'  \
    --quantMode TranscriptomeSAM --outSAMtype BAM Unsorted --outSAMattributes NH HI AS NM MD --readFilesCommand zcat --twopassMode Basic --runRNGseed 0 --outFilterMultimapNmax 20 --alignSJDBoverhangMin 1 --outSAMstrandField intronMotif  --quantTranscriptomeSAMoutput BanSingleEnd



if [ -f RAP1_IAA_30M_REP1.Unmapped.out.mate1 ]; then
    mv RAP1_IAA_30M_REP1.Unmapped.out.mate1 RAP1_IAA_30M_REP1.unmapped_1.fastq
    gzip RAP1_IAA_30M_REP1.unmapped_1.fastq
fi
if [ -f RAP1_IAA_30M_REP1.Unmapped.out.mate2 ]; then
    mv RAP1_IAA_30M_REP1.Unmapped.out.mate2 RAP1_IAA_30M_REP1.unmapped_2.fastq
    gzip RAP1_IAA_30M_REP1.unmapped_2.fastq
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:STAR_ALIGN":
    star: $(STAR --version | sed -e "s/STAR_//g")
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
    gawk: $(echo $(gawk --version 2>&1) | sed 's/^.*GNU Awk //; s/, .*$//')
END_VERSIONS
