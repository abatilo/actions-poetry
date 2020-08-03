# actions-poetry
GitHub Actions for Python projects using poetry

[![license](https://img.shields.io/github/license/abatilo/actions-poetry.svg)](https://github.com/tokusumi/actions-poetry/blob/master/LICENSE)
[![release](https://img.shields.io/github/release/tokusumi/actions-poetry.svg)](https://github.com/tokusumi/actions-poetry/releases/latest)
[![GitHub release date](https://img.shields.io/github/release-date/tokusumi/actions-poetry.svg)](https://github.com/tokusumi/actions-poetry/releases)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=tokusumi/actions-poetry)](https://dependabot.com)

- [python-poetry/poetry: Python dependency management and packaging made easy.](https://github.com/python-poetry/poetry)

## Getting started

### Create your workflow
```yaml
name: Run Tests
on: push

jobs:
  pytest:
    name: pytest
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Install Poetry
      uses: tokusumi/actions-poetry@v2.0.0
      with:
        python_version: 3.8
        poetry_version: 1.0.0
        working_directory: ./working_dir # Optional, defaults to '.'
    - name: Run pytest
      uses: tokusumi/actions-poetry@v2.0.0
      with:
        working_directory: ./working_dir
        command: run python -m pytest --cov=src --cov-branch --cov-fail-under=100 tests/
```

## License

[MIT License - abatilo/actions-poetry]

[MIT License - abatilo/actions-poetry]: https://github.com/abatilo/actions-poetry/blob/master/LICENSE


## About the author

- [abatilo's homepage](https://www.aaronbatilo.dev/)
