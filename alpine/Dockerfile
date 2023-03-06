FROM alpine:3.17.2

ARG CONTAINER_NAME=alpine
ARG USER_NAME=exie
ARG GROUP_NAME=party

ENV CONTAINER=$CONTAINER_NAME \
    USER=$USER_NAME \
    GROUP=$GROUP_NAME \
    TZ=Etc/UTC \
    LANG=en_US.utf8

COPY packages.list /tmp

RUN set -eux; \
    apk update; \
    xargs -r apk -v --update-cache add < /tmp/packages.list; \
    rm -rf /var/cache/apk/*; \
    rm /tmp/packages.list; \
    addgroup --system --gid 1001 $GROUP; \
    adduser --system --disabled-password --no-create-home --uid 1001 $USER -G $GROUP -s /bin/bash

USER $USER
