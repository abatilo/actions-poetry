#!/bin/bash
set -e
pyenv latest install "$INPUT_PYTHON_VERSION"
pyenv latest global "$INPUT_PYTHON_VERSION"
pip install -r /requirements.txt
pip install poetry=="$INPUT_POETRY_VERSION"
pyenv rehash

# If INPUT_DIRECTORY variable is defined, try to CD into it.
if [ -n "$INPUT_WORKING_DIRECTORY" ]; then
  pushd . > /dev/null 2>&1 || return
  cd "$INPUT_WORKING_DIRECTORY" || return

  echo -e "Changing to working directory $INPUT_WORKING_DIRECTORY..."
fi

# Fix for virtualenvs defined in .python-version.
pyenv local "$INPUT_PYTHON_VERSION"

sh -c "poetry $*"

# Step back to starting directory.
if [ -n "$INPUT_WORKING_DIRECTORY" ]; then
  popd > /dev/null 2>&1 || return
fi
