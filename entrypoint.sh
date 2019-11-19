#!/bin/sh
pythonVersion="$INPUT_PYTHON_VERSION"
poetryVersion="$INPUT_POETRY_VERSION"
pyenv install $pythonVersion
pyenv global $pythonVersion
pip install -r /requirements.txt
pip install poetry==$poetryVersion
pyenv rehash

sh -c "poetry $*"
