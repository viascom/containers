FROM viascom/alpine:3.17.2

ARG CONTAINER_NAME=postgres
ARG PORT_NUMBER=57136

ENV CONTAINER=$CONTAINER_NAME \
    PORT=$PORT_NUMBER \
    LANG=en_US.utf8 \
    PG_DATA_FOLDER=/var/lib/postgresql/data \
    PG_RUN_FOLDER=/run/postgresql \
    PG_LOG_FOLDER=/var/log/postgresql

USER root

COPY packages.list /tmp
COPY run_service.sh /etc

RUN set -eux; \
    apk update; \
    xargs -r apk -v --update-cache add < /tmp/packages.list; \
    rm -rf /var/cache/apk/*; \
    rm /tmp/packages.list; \
    chmod +x /etc/run_service.sh; \
    mkdir -p $PG_RUN_FOLDER; \
    chown $USER:$GROUP $PG_RUN_FOLDER; \
    mkdir -p $PG_DATA_FOLDER; \
    chmod 0700 $PG_DATA_FOLDER; \
    chown -R $USER:$GROUP /var/lib/postgresql; \
    mkdir -p $PG_LOG_FOLDER; \
    chown $USER:$GROUP $PG_LOG_FOLDER

USER $USER
RUN initdb --pgdata=$PG_DATA_FOLDER --encoding=UTF8 --username=$USER
COPY postgresql.conf $PG_DATA_FOLDER
COPY pg_hba.conf $PG_DATA_FOLDER

VOLUME pg_data
VOLUME pg_log

EXPOSE $PORT

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/etc/run_service.sh"]
