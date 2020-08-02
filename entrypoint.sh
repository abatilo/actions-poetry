#!/bin/bash
set -e

# Push current directory on to stack and cd (if possible) into working dir.
pushd . > /dev/null 2>&1 || return
cd "$INPUT_WORKING_DIRECTORY" || return

sh -c "poetry $*"

# Clean up __pycache__
find . -type d -name  "__pycache__" -exec rm -r {} +

# # Step back to starting directory.
popd > /dev/null 2>&1 || return
