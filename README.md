# actions-poetry
GitHub Actions for Python projects using poetry

[![license](https://img.shields.io/github/license/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/blob/master/LICENSE)
[![release](https://img.shields.io/github/release/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/releases/latest)
[![GitHub release date](https://img.shields.io/github/release-date/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/releases)

- [sdispater/poetry: Python dependency management and packaging made easy.](https://github.com/sdispater/poetry)

## Getting started

| Branch   | Base image             | Poetry version |
| ------   | ---------------------- | -------------- |
| `master` | `python:3.7.4-stretch` | `0.12.17`      |
| `3.7.4`  | `python:3.7.4-stretch` | `0.12.17`      |
| `3.7.3`  | `python:3.7.3-stretch` | `0.12.17`      |

### Create your workflow
Example taken from [abatilo/typed-json-dataclass](https://github.com/abatilo/typed-json-dataclass/blob/433fa994d3aafd733f491a04f99507739ce895f2/README.md)

```yaml
on:
  pull_request:
    branches:
    - master

name: Publish typed_json_dataclass
jobs:
  flake8:
    name: flake8
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Install
      uses: abatilo/actions-poetry@master
      with:
        args: install
    - name: Run flake8
      uses: abatilo/actions-poetry@master
      with:
        args: run python -m flake8 --show-source --import-order-style pep8 typed_json_dataclass
          tests
  pytest:
    name: pytest
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Install
      uses: abatilo/actions-poetry@master
      with:
        args: install
    - name: Run pytest
      uses: abatilo/actions-poetry@master
      with:
        args: run python -m pytest --cov-report xml:codecov.xml --cov=typed_json_dataclass
          --cov-report=html --junit-xml=coverage.xml --cov-branch --cov-fail-under=100
          tests/
```

## License

[MIT License - abatilo/actions-poetry]

[MIT License - abatilo/actions-poetry]: https://github.com/abatilo/actions-poetry/blob/master/LICENSE


## About the author

- [abatilo's homepage](https://www.aaronbatilo.dev/)
