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

### Create `main.workflow`

```hcl
workflow "Publish Python package" {
  on = "push"
  resolves = ["publish"]
}

action "Install" {
  uses = "abatilo/actions-poetry@master"
  args = ["install"]
}

action "Run black" {
  needs = "Install"
  uses = "abatilo/actions-poetry@master"
  args = ["run", "python", "-m", "black", "--check", "."]
}

action "Run pylint" {
  needs = "Install"
  uses = "abatilo/actions-poetry@master"
  args = ["run", "python", "-m", "pylint", "src"]
}

action "Master branch" {
  needs = ["Run pylint", "Run black"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "publish" {
  needs = "Master branch"
  uses = "abatilo/actions-poetry@master"
  secrets = ["PYPI_USERNAME", "PYPI_PASSWORD"]
  args = ["publish", "--build", "--no-interaction", "-vv", "--username", "$PYPI_USERNAME", "--password", "$PYPI_PASSWORD"]
}

```

## License

[MIT License - abatilo/actions-poetry]

[MIT License - abatilo/actions-poetry]: https://github.com/abatilo/actions-poetry/blob/master/LICENSE


## About the author

- [abatilo's homepage](https://www.aaronbatilo.dev/)
