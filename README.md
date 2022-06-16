# actions-poetry
GitHub Actions for Python projects using poetry

[![license](https://img.shields.io/github/license/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/blob/master/LICENSE)
[![release](https://img.shields.io/github/release/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/releases/latest)
[![GitHub release date](https://img.shields.io/github/release-date/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/releases)

- [python-poetry/poetry: Python dependency management and packaging made easy.](https://github.com/python-poetry/poetry)

## Getting started

### Breaking changes for v2
We've drastically simplified this GitHub Action for v2. This is no longer a
Docker action that runs as its own container, it's just a simplified way for
you to install poetry. This action now makes an assumption that you've already
setup Python via `setup-python` or some other way. Since we're installing poetry directly to your environment, this also means that you can cache your dependencies more easily since everything is running on the host runner instead of an isolated container environment.

### Create your workflow
```yaml
name: CI
on: pull_request

jobs:
  ci:
    strategy:
      fail-fast: false
      matrix:
        python-version: ["3.6", "3.7", "3.8", "3.9", "3.10"]
        poetry-version: ["1.0", "1.1.11"]
        os: [ubuntu-18.04, macos-latest, windows-latest]
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: ${{ matrix.python-version }}
      - name: Run image
        uses: abatilo/actions-poetry@v2.0.0
        with:
          poetry-version: ${{ matrix.poetry-version }}
      - name: View poetry --help
        run: poetry --help
```

## License

[MIT License - abatilo/actions-poetry]

[MIT License - abatilo/actions-poetry]: https://github.com/abatilo/actions-poetry/blob/master/LICENSE


## About the author

- [abatilo's homepage](https://www.aaronbatilo.dev/)
