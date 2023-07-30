#!/bin/bash -e

# This script is executed within the container as root.  It assumes
# that source code with debian packaging files can be found at
# /source-ro and that resulting packages are written to /output after
# succesful build.  These directories are mounted as docker volumes to
# allow files to be exchanged between the host and the container.

# Make read-write copy of source code
mkdir -p /build
cp -a /source-ro /build/source
cd /build/source

# Build the package
dpkg-buildpackage -us -uc -b

# `dpkg-buildpackage` places the built artifacts in the parent directory
# (../). Thus, copy all relevant built artifacts from /build/ to /output/.
cp -a /build/*.deb /build/*.buildinfo /build/*.changes /output/
ls -l /output
