FROM viascom/alpine:3.17.2

ARG CONTAINER_NAME=barman

ENV CONTAINER=$CONTAINER_NAME

USER root

COPY packages.list /tmp
COPY run_service.sh /etc

RUN apk update; \
    xargs -r apk -v --update-cache add < /tmp/packages.list; \
    rm -rf /var/cache/apk/*; \
    rm /tmp/packages.list; \
    chmod +x /etc/run_service.sh

USER $USER

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/etc/run_service.sh"]
