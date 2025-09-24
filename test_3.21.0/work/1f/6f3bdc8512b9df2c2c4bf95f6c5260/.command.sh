#!/usr/bin/env bash -C -e -u -o pipefail
# When we stage in the index files the time stamps get disturbed, which
# bbsplit doesn't like. Fix the time stamps in its summaries. This needs to
# be done via Java to match what bbmap does

if [ bbsplit ]; then
    for summary_file in $(find bbsplit/ref/genome -name summary.txt); do
        src=$(grep '^source' "$summary_file" | cut -f2- -d$'\t' | sed 's|.*/bbsplit|bbsplit|')
        mod=$(echo "System.out.println(java.nio.file.Files.getLastModifiedTime(java.nio.file.Paths.get(\"$src\")).toMillis());" | jshell -J-Djdk.lang.Process.launchMechanism=vfork -)
        sed "s|^last modified.*|last modified\t$mod|" "$summary_file" > ${summary_file}.tmp && mv ${summary_file}.tmp ${summary_file}
    done
fi

# Run BBSplit

bbsplit.sh \
    -Xmx12288M \
    path=bbsplit \
    threads=4 \
    in=RAP1_IAA_30M_REP1_trimmed_1_val_1.fq.gz in2=RAP1_IAA_30M_REP1_trimmed_2_val_2.fq.gz \
    basename=RAP1_IAA_30M_REP1_%_#.fastq.gz \
    refstats=RAP1_IAA_30M_REP1.stats.txt \
    build=1 ambiguous2=all maxindel=150000 ow=f 2>| >(tee RAP1_IAA_30M_REP1.log >&2)

# Summary files will have an absolute path that will make the index
# impossible to use in other processes- we can fix that

for summary_file in $(find bbsplit/ref/genome -name summary.txt); do
    src=$(grep '^source' "$summary_file" | cut -f2- -d$'\t' | sed 's|.*/bbsplit|bbsplit|')
    sed "s|^source.*|source\t$src|" "$summary_file" > ${summary_file}.tmp && mv ${summary_file}.tmp ${summary_file}
done

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:BBMAP_BBSPLIT":
    bbmap: $(bbversion.sh | grep -v "Duplicate cpuset")
END_VERSIONS
