#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Treat unset variables as an error when substituting.
set -u

# Re-create build and move there. 
rm -rf _build_armhf
mkdir _build_armhf
cd _build_armhf

cmake ../cmake -DCMAKE_TOOLCHAIN_FILE=$1 -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_EXAMPLES=OFF

# Build & create package
make
make package

# Move generated package to folder where build script can find it
mv *.deb .. 
