ARG INPUT_PYTHON_VERSION=3.7
FROM python:${INPUT_PYTHON_VERSION}-slim-buster

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      build-essential \
      curl \
      git \
      libbz2-dev \
      libffi-dev \
      liblzma-dev \
      libncurses5-dev \
      libncursesw5-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      llvm \
      make \
      python-openssl \
      tk-dev \
      wget \
      xz-utils \
      zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG INPUT_POETRY_VERSION=1.0
RUN pip install pip==20.2 \
   poetry==${INPUT_POETRY_VERSION}

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
