#!/bin/sh

if [ ! -d "$PG_DATA_FOLDER" ] || [ -z "$(ls -A "$PG_DATA_FOLDER")" ]; then
    mkdir "$PG_DATA_FOLDER"
    initdb --pgdata="$PG_DATA_FOLDER" --encoding="$PG_DEFAULT_DATABASE_ENCODING" --username="$PG_SUPER_USER_NAME" --pwfile=<(echo $PG_SUPER_USER_PASSWORD)
    cp /tmp/postgresql.conf.backup "$PG_DATA_FOLDER"/postgresql.conf
    cp /tmp/pg_hba.conf.backup "$PG_DATA_FOLDER"/pg_hba.conf
fi

if [ ! -d "$PG_LOG_FOLDER" ]; then
    mkdir "$PG_LOG_FOLDER"
fi

pg_ctl start -D "$PG_DATA_FOLDER" -l "$PG_LOG_FOLDER"/postgres.log
tail -F "$(awk '{print $2}' "$PG_DATA_FOLDER"/current_logfiles)"