#!/bin/bash
set -e
pyenv latest install "$INPUT_PYTHON_VERSION"
pyenv latest global "$INPUT_PYTHON_VERSION"
pip install -r /requirements.txt
pip install poetry=="$INPUT_POETRY_VERSION"
pyenv rehash

# Push current directory on to stack and cd (if possible) into working dir.
pushd . > /dev/null 2>&1 || return
cd "$INPUT_WORKING_DIRECTORY" || return

# Fix for virtualenvs defined in .python-version.
pyenv latest local "$INPUT_PYTHON_VERSION"

sh -c "poetry $*"

# Step back to starting directory.
popd > /dev/null 2>&1 || return
