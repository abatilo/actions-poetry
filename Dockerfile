FROM python:3.8.0-alpine3.10

RUN pip install poetry==0.12.17

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
