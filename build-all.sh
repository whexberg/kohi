#!/bin/bash

# Build script for rebuilding everything

set echo on

echo "Building everything..."

pushd engine > /dev/null
source build.sh
ERRORLEVEL=$?
popd > /dev/null
[ $ERRORLEVEL -ne 0 ] && echo "Error: $ERRORLEVEL" && exit

pushd testbed > /dev/null
source build.sh
ERRORLEVEL=$?
popd > /dev/null
[ $ERRORLEVEL -ne 0 ] && echo "Error: $ERRORLEVEL" && exit

echo "All assemblies built successfully."
