#!/bin/bash
set -e
pyenv latest install "$INPUT_PYTHON_VERSION"
pyenv latest global "$INPUT_PYTHON_VERSION"
pip install -r /requirements.txt
pip install poetry=="$INPUT_POETRY_VERSION"
pyenv rehash

# If INPUT_DIRECTORY variable is defined, try to CD into it.
if [ -z "$INPUT_WORKING_DIRECTORY" ]; then
  pushd . > /dev/null 2>&1 || return
  cd "$INPUT_DIRECTORY" || return
fi

sh -c "poetry $*"

# Step back to starting directory.
if [ -z "$INPUT_WORKING_DIRECTORY" ]; then
  popd > /dev/null 2>&1 || return
fi
