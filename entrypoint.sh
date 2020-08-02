#!/bin/bash
set -e
set -x

# Push current directory on to stack and cd (if possible) into working dir.
pushd . > /dev/null 2>&1 || return
cd "$INPUT_WORKING_DIRECTORY" || return

if [ -n "${1}" ]; then
    sh -c "poetry ${1}"
fi

# Clean up __pycache__
find . -type d -name  "__pycache__" -exec rm -r {} +

# # Step back to starting directory.
popd > /dev/null 2>&1 || return
