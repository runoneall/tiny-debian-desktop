#!/bin/bash
set -e

if [ -z "${USER_PASSWD}" ]; then
  echo "ERROR: The USER_PASSWD environment variable is not set." >&2
  exit 1
fi

passwd -d root
x11vnc -storepasswd "$USER_PASSWD" /etc/x11vnc.pass

exec /bin/bash /daemon.sh
