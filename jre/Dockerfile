FROM alpine:3.17.2

ARG CONTAINER_NAME=viascom-je
ARG USER=exie
ARG GROUP=party

ENV CONTAINER=$CONTAINER_NAME \
    TZ=Etc/UTC

COPY packages.list /tmp

RUN wget -P /etc/apk/keys https://cdn.azul.com/public_keys/alpine-signing@azul.com-5d5dc44c.rsa.pub; \
    echo 'https://repos.azul.com/zulu/alpine' | tee -a /etc/apk/repositories; \
    apk update; \
    xargs -r apk -v --update-cache add < /tmp/packages.list; \
    rm -rf /var/cache/apk/*; \
    rm /tmp/packages.list; \
    addgroup -S $GROUP; \
    adduser -S -D -H $USER -G $GROUP -s /bin/bash

USER $USER
