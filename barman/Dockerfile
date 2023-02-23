FROM alpine:3.17.2

ARG CONTAINER_NAME=viascom-barman
ARG USER=exie
ARG GROUP=party

ENV CONTAINER=$CONTAINER_NAME \
    TZ=Etc/UTC

COPY packages.list /tmp
COPY run_service.sh /etc

RUN apk update; \
    xargs -r apk -v --update-cache add < /tmp/packages.list; \
    rm -rf /var/cache/apk/*; \
    rm /tmp/packages.list; \
    chmod +x /etc/run_service.sh; \
    addgroup -S $GROUP; \
    adduser -S -D -H $USER -G $GROUP -s /bin/bash; \
    mkdir /var/run/pgpool; \
    chown $USER:$GROUP /var/run/pgpool; \
    mkdir /var/log/pgpool; \
    chown $USER:$GROUP /var/log/pgpool

USER $USER

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/etc/run_service.sh"]
