#!/bin/bash
# Build the macOS command-line UAF harness (no ARC; harness uses manual CF/IOKit).
set -e
clang -x objective-c -fno-objc-arc -O1 -g -o uaf \
  main.m entry_isurf_uaf.m \
  -framework Foundation -framework IOKit -framework Metal -framework CoreVideo
echo "build OK -> ./uaf"