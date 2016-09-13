#!/bin/bash

if [ "$1" = 'rsyncd' ]; then
    echo "[Run] Starting rsyncd"

    exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf
fi

echo "[RUN]: Builtin command not provided [uwsgi]"
echo "[RUN]: $@"

exec "$@"
