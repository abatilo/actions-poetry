FROM docker:dind

COPY Dockerfile-core entrypoint.sh /

COPY setup.sh /setup.sh

RUN chmod 755 /setup.sh

ENTRYPOINT ["/setup.sh"]
