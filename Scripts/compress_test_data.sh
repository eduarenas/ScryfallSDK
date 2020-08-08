#!/usr/bin/env bash

mkdir -p Tests/ScryfallSDKTests/Data/Compressed
tar --lzma -C Tests/ScryfallSDKTests/Data/Decompressed -cvf Tests/ScryfallSDKTests/Data/Compressed/rulings.json.lzma rulings.json
tar --lzma -C Tests/ScryfallSDKTests/Data/Decompressed -cvf Tests/ScryfallSDKTests/Data/Compressed/all_cards.json.lzma all_cards.json
