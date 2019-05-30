FROM python:3.7.3-stretch

LABEL "com.github.actions.name"="poetry - Python"
LABEL "com.github.actions.description"="GitHub Actions for Python projects using poetry"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/abatilo/actions-poetry"
LABEL "homepage"="https://github.com/abatilo/actions-poetry"
LABEL "maintainer"="abatilo"

RUN pip install poetry==0.12.16

RUN useradd --create-home poetryuser
USER poetryuser

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
