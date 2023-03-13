#!/bin/sh

if [ ! -d "$PG_DATA_FOLDER" ] || [ -z "$(ls -A "$PG_DATA_FOLDER")" ]; then
    mkdir "$PG_DATA_FOLDER"
    initdb --pgdata="$PG_DATA_FOLDER" --encoding="$ENCODING" --username="$USER" --pwfile=<(echo $PG_SUPER_USER_PASSWORD)
    cp /tmp/postgresql.conf.backup "$PG_DATA_FOLDER"/postgresql.conf
    cp /tmp/pg_hba.conf.backup "$PG_DATA_FOLDER"/pg_hba.conf
fi

pg_ctl start -D /var/lib/postgresql/data -l /var/log/postgresql/postgres.log
tail -F "$(awk '{print $2}' "$PG_DATA_FOLDER"/current_logfiles)"