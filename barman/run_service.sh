#!/bin/sh

pgpool -f /usr/local/etc/pgpool.conf -F /usr/local/etc/pcp.conf
tail -f /var/log/pgpool.log