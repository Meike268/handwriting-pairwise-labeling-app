#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit 1

git pull
git submodule update
$SCRIPT_DIR/_update_files.sh

docker-compose build
docker-compose down
docker-compose up -d

docker image prune -f
