#!/bin/sh

pg_ctl start -D /var/lib/postgresql/data -l /var/log/postgresql/postgres.log
tail -f /var/log/postgresql/postgres.log