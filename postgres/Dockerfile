FROM viascom/alpine:3.17.2

ARG CONTAINER_NAME=postgres
ARG PORT_NUMBER=5432

ENV CONTAINER=$CONTAINER_NAME \
    PORT=$PORT_NUMBER \
    LANG=en_US.utf8 \
    TZ=Etc/UTC

USER root

COPY packages.list /tmp
COPY run_service.sh /etc

RUN set -eux; \
    apk update; \
    xargs -r apk -v --update-cache add < /tmp/packages.list; \
    rm -rf /var/cache/apk/*; \
    rm /tmp/packages.list; \
    chmod +x /etc/run_service.sh; \
    mkdir -p /run/postgresql; \
    chown $USER:$GROUP /run/postgresql; \
    mkdir -p /var/lib/postgresql/data; \
    chmod 0700 /var/lib/postgresql/data; \
    chown -R $USER:$GROUP /var/lib/postgresql; \
    mkdir -p /var/log/postgresql; \
    chown $USER:$GROUP /var/log/postgresql

USER $USER
RUN initdb -D /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

RUN echo "host all all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/pg_hba.conf; \
    echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf; \
    echo "port='$PORT'" >> /var/lib/postgresql/data/postgresql.conf

EXPOSE $PORT

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/etc/run_service.sh"]
