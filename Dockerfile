FROM python:3.7.4-stretch

RUN pip install poetry==0.12.17

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
