FROM docker:dind

COPY setup.sh /setup.sh

RUN chmod 755 /setup.sh

ENTRYPOINT ["/setup.sh"]
