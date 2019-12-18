#!/bin/sh
set -e
pythonVersion="$INPUT_PYTHON_VERSION"
poetryVersion="$INPUT_POETRY_VERSION"
pyenv latest install $pythonVersion
pyenv latest global $pythonVersion
pip install -r /requirements.txt
pip install poetry==$poetryVersion
pyenv rehash

sh -c "poetry $*"
