FROM python:3.8.0-alpine3.10

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
