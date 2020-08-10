#!/usr/bin/env bash

mkdir -p Tests/ScryfallSDKTests/Data/Decompressed

for file in Tests/ScryfallSDKTests/Data/Compressed/*.json.lzma; do
    file_name=$(basename $file)
    echo Decompressing $file_name...
    tar --lzma -xvf Tests/ScryfallSDKTests/Data/Compressed/$file_name -C Tests/ScryfallSDKTests/Data/Decompressed
    echo Done decompressing $file_name.
done
