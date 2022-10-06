#!/bin/bash

# Build script for rebuilding everything

set echo on
set -e

echo "Building everything..."

pushd engine >/dev/null
source build.sh
ERRORLEVEL=$?
popd >/dev/null
if [ $ERRORLEVEL -ne 0 ]; then
    echo "Error: engine/build.sh exited with code: $ERRORLEVEL"
    exit
fi

pushd testbed >/dev/null
source build.sh
ERRORLEVEL=$?
popd >/dev/null
if [ $ERRORLEVEL -ne 0 ]; then
    echo "Error: testbed/build.sh exited with code: $ERRORLEVEL"
    exit
fi

echo "All assemblies built successfully."
echo ""
