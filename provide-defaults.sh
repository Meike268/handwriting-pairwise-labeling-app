#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit 1

ENV_FILE=.env
if [ ! -f "$ENV_FILE" ]; then
  echo \
"MYSQL_ROOT_PASSWORD=
MYSQL_PASSWORD=

MYSQL_PORT=3370
BACKEND_PORT=8070
FRONTEND_PORT=3070

FRONTEND_URL=https://hla.lukas-ist-ein-geiler-hund.de
BACKEND_URL=https://hla.lukas-ist-ein-geiler-hund.de/api
" \
> "$ENV_FILE"
fi