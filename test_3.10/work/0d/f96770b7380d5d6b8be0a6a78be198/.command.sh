#!/bin/bash -ue
STAR \
    --genomeDir star \
    --readFilesIn WT_REP1_primary_1.fastq.gz WT_REP1_primary_2.fastq.gz  \
    --runThreadN 2 \
    --outFileNamePrefix WT_REP1. \
     \
    --sjdbGTFfile genome_gfp.gtf \
    --outSAMattrRGline ID:WT_REP1 'SM:WT_REP1'   \
    --quantMode TranscriptomeSAM --twopassMode Basic --outSAMtype BAM Unsorted --readFilesCommand zcat --runRNGseed 0 --outFilterMultimapNmax 20 --alignSJDBoverhangMin 1 --outSAMattributes NH HI AS NM MD --quantTranscriptomeBan Singleend --outSAMstrandField intronMotif



if [ -f WT_REP1.Unmapped.out.mate1 ]; then
    mv WT_REP1.Unmapped.out.mate1 WT_REP1.unmapped_1.fastq
    gzip WT_REP1.unmapped_1.fastq
fi
if [ -f WT_REP1.Unmapped.out.mate2 ]; then
    mv WT_REP1.Unmapped.out.mate2 WT_REP1.unmapped_2.fastq
    gzip WT_REP1.unmapped_2.fastq
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:STAR_ALIGN":
    star: $(STAR --version | sed -e "s/STAR_//g")
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
    gawk: $(echo $(gawk --version 2>&1) | sed 's/^.*GNU Awk //; s/, .*$//')
END_VERSIONS
