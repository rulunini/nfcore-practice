#!/usr/bin/env bash -C -e -u -o pipefail
STAR \
    --genomeDir star \
    --readFilesIn input1/WT_REP2_primary_1.fastq.gz input2/WT_REP2_primary_2.fastq.gz \
    --runThreadN 4 \
    --outFileNamePrefix WT_REP2. \
     \
    --sjdbGTFfile genome_gfp.gtf \
    --outSAMattrRGline 'ID:WT_REP2'  'SM:WT_REP2'  \
    --quantMode TranscriptomeSAM --outSAMtype BAM Unsorted --outSAMattributes NH HI AS NM MD --readFilesCommand zcat --twopassMode Basic --runRNGseed 0 --outFilterMultimapNmax 20 --alignSJDBoverhangMin 1 --outSAMstrandField intronMotif  --quantTranscriptomeSAMoutput BanSingleEnd



if [ -f WT_REP2.Unmapped.out.mate1 ]; then
    mv WT_REP2.Unmapped.out.mate1 WT_REP2.unmapped_1.fastq
    gzip WT_REP2.unmapped_1.fastq
fi
if [ -f WT_REP2.Unmapped.out.mate2 ]; then
    mv WT_REP2.Unmapped.out.mate2 WT_REP2.unmapped_2.fastq
    gzip WT_REP2.unmapped_2.fastq
fi

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:STAR_ALIGN":
    star: $(STAR --version | sed -e "s/STAR_//g")
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
    gawk: $(echo $(gawk --version 2>&1) | sed 's/^.*GNU Awk //; s/, .*$//')
END_VERSIONS
