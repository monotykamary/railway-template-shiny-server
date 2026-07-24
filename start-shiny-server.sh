#!/usr/bin/env bash
set -euo pipefail

port="${PORT:-3838}"
if ! [[ "$port" =~ ^[0-9]+$ ]] || (( port < 1 || port > 65535 )); then
  echo "PORT must be an integer between 1 and 65535" >&2
  exit 1
fi

sed "s/__PORT__/$port/g" /etc/shiny-server/shiny-server.conf > /tmp/shiny-server.conf
mv /tmp/shiny-server.conf /etc/shiny-server/shiny-server.conf

exec /init
