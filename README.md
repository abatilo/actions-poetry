# actions-poetry
GitHub Actions for Python projects using poetry

[![license](https://img.shields.io/github/license/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/blob/master/LICENSE)
[![release](https://img.shields.io/github/release/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/releases/latest)
[![GitHub release date](https://img.shields.io/github/release-date/abatilo/actions-poetry.svg)](https://github.com/abatilo/actions-poetry/releases)

- [sdispater/poetry: Python dependency management and packaging made easy.](https://github.com/sdispater/poetry)

## Getting started

| Branch | Base image             |
| ------ | ---------------------- |
| 3.7.3  | `python:3.7.3-stretch`   |

### Create `main.workflow`

```hcl
workflow "Python workflow" {
  on = "push"
  resolves = ["publish"]
}

action "publish" {
  needs = "poetry-build"
  uses = "abatilo/actions-poetry@3.7.3"
  args = ["publish", "--build", "--no-interaction", "-vv", "--username", "$PYPI_USERNAME", "--password", "$PYPI_PASSWORD"]
}
```

## License

[MIT License - abatilo/actions-poetry]

[MIT License - abatilo/actions-poetry]: https://github.com/abatilo/actions-poetry/blob/master/LICENSE


## About the author

- [abatilo's homepage](https://www.aaronbatilo.dev/)
