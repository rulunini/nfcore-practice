#!/bin/bash -ue
mkdir output

## Ensures --strip-components only applied when top level of tar contents is a directory
## If just files or multiple directories, place all in output
if [[ $(tar -tzf salmon.tar.gz | grep -o -P "^.*?\/" | uniq | wc -l) -eq 1 ]]; then
    tar \
        -C output --strip-components 1 \
        -xzvf \
         \
        salmon.tar.gz \
        --no-same-owner
else
    tar \
        -C output \
        -xzvf \
         \
        salmon.tar.gz \
        --no-same-owner
fi

mv output salmon

cat <<-END_VERSIONS > versions.yml
"NFCORE_RNASEQ:RNASEQ:PREPARE_GENOME:UNTAR_SALMON_INDEX":
    untar: $(echo $(tar --version 2>&1) | sed 's/^.*(GNU tar) //; s/ Copyright.*$//')
END_VERSIONS
