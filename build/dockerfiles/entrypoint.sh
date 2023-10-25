#!/usr/bin/env bash
set -Eeo pipefail

if [[ "$1" == "kong" && "$2" == "docker-start" ]]
then
    export KONG_PREFIX=${KONG_PREFIX:=/usr/local/kong}

    ln -sfn /dev/stdout $KONG_PREFIX/logs/access.log
    ln -sfn /dev/stdout $KONG_PREFIX/logs/admin_access.log
    ln -sfn /dev/stderr $KONG_PREFIX/logs/error.log

    export KONG_NGINX_DAEMON=${KONG_NGINX_DAEMON:=off}

    exec kong start
fi

exec "$@"
