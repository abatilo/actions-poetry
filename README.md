# actions-poetry
GitHub Actions for Python projects using poetry

[![license](https://img.shields.io/github/license/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/blob/master/LICENSE)
[![release](https://img.shields.io/github/release/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/releases/latest)
[![GitHub release date](https://img.shields.io/github/release-date/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/releases)

- [python-poetry/poetry: Python dependency management and packaging made easy.](https://github.com/python-poetry/poetry)

## Getting started

### Breaking changes for v3

We've started installing `poetry` with `pipx` to keep the installed artifacts
isolated away from any of your application dependencies. v3 will install `pipx`
for you as well.

### Breaking changes for v2

We've drastically simplified this GitHub Action for v2.
This is no longer a Docker action that runs as its own container,
it's just a simplified way for you to install poetry.
This action now makes an assumption that you've already setup Python via `setup-python` or some other way.
Since we're installing poetry directly to your environment,
this also means that you can cache your dependencies more easily since everything is running on the host runner instead of an isolated container environment.

### Create your workflow

```yaml
name: CI
on: pull_request

jobs:
  ci:
    strategy:
      fail-fast: false
      matrix:
        python-version: ["3.9", "3.10", "3.11", "3.12", "3.13"]
        poetry-version: ["latest", "main", "1.8.4"]
        os: [ubuntu-22.04, macos-latest, windows-latest]
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}
      - name: Run image
        uses: abatilo/actions-poetry@v3
        with:
          poetry-version: ${{ matrix.poetry-version }}
      - name: View poetry --help
        run: poetry --help
```

### Workflow example: cache the virtual environment

It is possible to combine `actions/poetry` with [actions/cache](https://github.com/actions/cache) to speed up the installation of dependencies.
The recipe is:

1. to ask `poetry` to create a virtual environment inside the project:
it creates a local `.venv/` folder that can be cached
2. to create a cache key that involves the contents of the `poetry.lock` file:
if the contents change (meaning that dependencies have changed), then the cache needs to be invalidated and recreated

For the 1st step, you either need:

- to have a `poetry.toml` file
  (and [not `pyproject.toml`](https://github.com/python-poetry/poetry/issues/2937))
  at the root of your project with these 2 settings:

```ini
[virtualenvs]
create = true
in-project = true
```

- or to run the following commands in the github actions to create the `poetry.toml` file:

```sh
poetry config virtualenvs.create true --local
poetry config virtualenvs.in-project true --local
```

Here is an example of how the steps must be declared:

```yaml
jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install Python
        uses: actions/setup-python@v4
        # see details (matrix, python-version, python-version-file, etc.)
        # https://github.com/actions/setup-python
      - name: Install poetry
        uses: abatilo/actions-poetry@v4
      - name: Setup a local virtual environment (if no poetry.toml file)
        run: |
          poetry config virtualenvs.create true --local
          poetry config virtualenvs.in-project true --local
      - uses: actions/cache@v3
        name: Define a cache for the virtual environment based on the dependencies lock file
        with:
          path: ./.venv
          key: venv-${{ hashFiles('poetry.lock') }}
      - name: Install the project dependencies
        run: poetry install
      - name: Run the automated tests (for example)
        run: poetry run pytest -v
```

## License

[MIT License - abatilo/actions-poetry]

[MIT License - abatilo/actions-poetry]: https://github.com/abatilo/actions-poetry/blob/master/LICENSE

## About the author

- [abatilo's homepage](https://www.aaronbatilo.dev/)
