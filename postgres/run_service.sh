#!/bin/sh

if [ ! -d "$PG_DATA_FOLDER" ] || [ -z "$(ls -A "$PG_DATA_FOLDER")" ]; then
    mkdir "$PG_DATA_FOLDER"
    initdb --pgdata="$PG_DATA_FOLDER" --encoding="$ENCODING" --username="$USER"
fi

pg_ctl start -D /var/lib/postgresql/data
tail -F /var/log/postgresql/postgresql-*.json