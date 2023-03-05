FROM viascom/alpine:3.17.2

ARG CONTAINER_NAME=viascom-pgpool
ARG USER=exie
ARG GROUP=party
ARG PORT=5430

ENV CONTAINER=$CONTAINER_NAME

USER root

COPY packages.list /tmp
COPY run_service.sh /etc

RUN set -eux; \
    apk update; \
    xargs -r apk -v --update-cache add < /tmp/packages.list; \
    rm -rf /var/cache/apk/*; \
    rm /tmp/packages.list; \
    chmod +x /etc/run_service.sh; \
    mkdir /var/run/pgpool; \
    chown $USER:$GROUP /var/run/pgpool; \
    mkdir /var/log/pgpool; \
    chown $USER:$GROUP /var/log/pgpool

USER $USER

EXPOSE $PORT

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/etc/run_service.sh"]
