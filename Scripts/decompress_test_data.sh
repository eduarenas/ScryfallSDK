#!/usr/bin/env bash

mkdir -p Tests/ScryfallSDKTests/Data/Decompressed
tar --lzma -xvf Tests/ScryfallSDKTests/Data/Compressed/rulings.json.lzma -C Tests/ScryfallSDKTests/Data/Decompressed
tar --lzma -xvf Tests/ScryfallSDKTests/Data/Compressed/all_cards.json.lzma -C Tests/ScryfallSDKTests/Data/Decompressed
