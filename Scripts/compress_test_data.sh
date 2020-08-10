#!/usr/bin/env bash

mkdir -p Tests/ScryfallSDKTests/Data/Compressed

for file in Tests/ScryfallSDKTests/Data/Decompressed/*.json; do
    file_name=$(basename $file)
    echo Compressing $file_name...
    tar --lzma -C Tests/ScryfallSDKTests/Data/Decompressed -cvf Tests/ScryfallSDKTests/Data/Compressed/$file_name.lzma $file_name
    echo Done compressing $file_name.
done
