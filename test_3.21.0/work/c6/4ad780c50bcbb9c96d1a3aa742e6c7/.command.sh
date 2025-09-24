#!/usr/bin/env bash -C -e -u -o pipefail
# When we stage in the index files the time stamps get disturbed, which
# bbsplit doesn't like. Fix the time stamps in its summaries. This needs to
# be done via Java to match what bbmap does

if [  ]; then
    for summary_file in $(find /ref/genome -name summary.txt); do
        src=$(grep '^source' "$summary_file" | cut -f2- -d$'\t' | sed 's|.*/bbsplit|bbsplit|')
        mod=$(echo "System.out.println(java.nio.file.Files.getLastModifiedTime(java.nio.file.Paths.get(\"$src\")).toMillis());" | jshell -J-Djdk.lang.Process.launchMechanism=vfork -)
        sed "s|^last modified.*|last modified\t$mod|" "$summary_file" > ${summary_file}.tmp && mv ${summary_file}.tmp ${summary_file}
    done
fi

# Run BBSplit

bbsplit.sh \
    -Xmx12288M \
    ref_primary=genome_gfp.fasta ref_sarscov2=GCA_009858895.3_ASM985889v3_genomic.200409.fna ref_human=chr22_23800000-23980000.fa path=bbsplit \
    threads=4 \
     \
     \
     \
    build=1 2>| >(tee null.log >&2)

# Summary files will have an absolute path that will make the index
# impossible to use in other processes- we can fix that

for summary_file in $(find bbsplit/ref/genome -name summary.txt); do
    src=$(grep '^source' "$summary_file" | cut -f2- -d$'\t' | sed 's|.*/bbsplit|bbsplit|')
    sed "s|^source.*|source\t$src|" "$summary_file" > ${summary_file}.tmp && mv ${summary_file}.tmp ${summary_file}
done

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:PREPARE_GENOME:BBMAP_BBSPLIT":
    bbmap: $(bbversion.sh | grep -v "Duplicate cpuset")
END_VERSIONS
