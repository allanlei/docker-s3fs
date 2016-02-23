#!/usr/bin/env sh
set -e

OPTS=""
if [ -n "$USE_CACHE" ]; then OPTS="$OPTS -ouse_cache=$USE_CACHE"; fi
if [ -n "$DEFAULT_ACL" ]; then OPTS="$OPTS -odefault_acl=$DEFAULT_ACL"; fi
if [ -n "$RETRIES" ]; then OPTS="$OPTS -oretries=$RETRIES"; fi
if [ -n "$USE_RRS" ]; then OPTS="$OPTS -ouse_rrs=$USE_RRS"; fi
if [ -n "$USE_SSE" ]; then OPTS="$OPTS -ouse_sse=$USE_SSE"; fi
if [ -n "$CONNECT_TIMEOUT" ]; then OPTS="$OPTS -oconnect_timeout=$CONNECT_TIMEOUT"; fi
if [ -n "$READWRITE_TIMEOUT" ]; then OPTS="$OPTS -oreadwrite_timeout=$READWRITE_TIMEOUT"; fi
if [ -n "$PARALLEL_COUNT" ]; then OPTS="$OPTS -oparallel_count=$PARALLEL_COUNT"; fi

if [ "$#" -eq 1 ];
then
    mkdir -p /mnt/$@
    exec s3fs -f "$OPTS" "$@" "/mnt/$@"
else
    exec s3fs "$OPTS" "$@"
fi
