# actions-pipenv
GitHub Actions for Python projects using pipenv.
Shameless adaptation of [abatilo/actions-poetry: GitHub Actions for Python projects using poetry](https://github.com/abatilo/actions-poetry)

[![license](https://img.shields.io/github/license/tiagovrtr/actions-pipenv.svg)](https://github.com/tiagovrtr/actions-pipenv/blob/master/LICENSE)
[![release](https://img.shields.io/github/release/tiagovrtr/actions-pipenv.svg)](https://github.com/tiagovrtr/actions-pipenv/releases/latest)
[![GitHub release date](https://img.shields.io/github/release-date/tiagovrtr/actions-pipenv.svg)](https://github.com/tiagovrtr/actions-pipenv/releases)

- [pypa/pipenv: Python Development Workflow for Humans.](https://github.com/pypa/pipenv)

## Getting started

### Implementation notes
This action makes the assumption that you've already
setup Python via `setup-python` or some other way. Since we're installing pipenv directly to your environment, this also means that you can cache your dependencies more easily since everything is running on the host runner instead of an isolated container environment.

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
        pipenv-version: ["v2022.9.8", "v2022.9.21"]
        os: [ubuntu-18.04, macos-latest, windows-latest]
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: ${{ matrix.python-version }}
          cache: "pipenv"
      - name: Run image
        uses: tiagovrtr/actions-pipenv@v1
        with:
          pipenv-version: ${{ matrix.pipenv-version }}
      - name: View pipenv --help
        run: pipenv --help
```

## License

[MIT License - abatilo/actions-poetry]

[MIT License - abatilo/actions-poetry]: https://github.com/abatilo/actions-poetry/blob/master/LICENSE