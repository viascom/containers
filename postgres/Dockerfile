FROM alpine:3.17.2

ARG CONTAINER_NAME=viascom-postgres
ARG USER=exie
ARG GROUP=party
ARG PORT=5432

ENV CONTAINER=$CONTAINER_NAME \
    LANG=en_US.utf8 \
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
    mkdir /var/run/postgresql; \
    chown $USER:$GROUP /var/run/postgresql; \
    mkdir /var/lib/postgresql/data; \
    chmod 0700 /var/lib/postgresql/data; \
    chown -R $USER:$GROUP /var/lib/postgresql; \
    mkdir /var/log/postgresql; \
    chown $USER:$GROUP /var/log/postgresql

USER $USER
RUN initdb -D /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

RUN echo "host all all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/pg_hba.conf; \
    echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf

EXPOSE $PORT

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/etc/run_service.sh"]
