FROM python:slim-buster

ENV PYENV_HOME=/root/.pyenv
ENV PATH $PYENV_HOME/shims:$PYENV_HOME/bin:$PATH

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

# Install pyenv, then install python versions
RUN git clone --depth 1 https://github.com/pyenv/pyenv.git $PYENV_HOME && \
    rm -rfv $PYENV_HOME/.git

COPY requirements.txt entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
