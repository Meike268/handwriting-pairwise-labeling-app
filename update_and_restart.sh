#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit 1

cd ./handwriting-labeling-app-frontend
git pull origin main
cd "$SCRIPT_DIR"
cd ./handwriting-labeling-app-backend
git pull origin main
cd "$SCRIPT_DIR"

docker-compose build
docker-compose down
docker-compose up -d