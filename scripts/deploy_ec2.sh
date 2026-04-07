#!/usr/bin/env bash

set -euo pipefail

# This script is intentionally small:
# 1. update the checked-out branch on the target EC2 host
# 2. render the Nginx config for the target hostname
# 3. rebuild and restart the non-prod Docker Compose service

: "${PATIENT_APP_APP_DIR:?PATIENT_APP_APP_DIR is required}"
: "${TARGET_BRANCH:?TARGET_BRANCH is required}"
: "${PATIENT_APP_ENV:?PATIENT_APP_ENV is required}"
: "${PATIENT_APP_ENV_FILE:?PATIENT_APP_ENV_FILE is required}"
: "${PATIENT_APP_DOMAIN:?PATIENT_APP_DOMAIN is required}"

PATIENT_APP_SERVER_NAME="${PATIENT_APP_SERVER_NAME:-$PATIENT_APP_DOMAIN}"
PATIENT_APP_TLS_DOMAIN="${PATIENT_APP_TLS_DOMAIN:-$PATIENT_APP_DOMAIN}"
PATIENT_APP_COMPOSE_FILE="${PATIENT_APP_COMPOSE_FILE:-docker-compose-gha.yaml}"
PATIENT_APP_CONTAINER_NAME="${PATIENT_APP_CONTAINER_NAME:-patient_app_${PATIENT_APP_ENV}}"

cd "$PATIENT_APP_APP_DIR"

# Keep the server checkout aligned with the branch that triggered the deploy.
git fetch --all --prune
git checkout "$TARGET_BRANCH"
git pull origin "$TARGET_BRANCH"

# Render the concrete Nginx config from the template before the Docker build.
PATIENT_APP_DOMAIN="$PATIENT_APP_DOMAIN" \
PATIENT_APP_SERVER_NAME="$PATIENT_APP_SERVER_NAME" \
bash scripts/render_nginx_conf.sh

export PATIENT_APP_ENV_FILE
export PATIENT_APP_NGINX_FILE="generated/default_ec2.conf"
export PATIENT_APP_TLS_DOMAIN
export PATIENT_APP_CONTAINER_NAME

# Validate Compose before touching running containers.
docker compose -f "$PATIENT_APP_COMPOSE_FILE" config >/dev/null
docker compose -f "$PATIENT_APP_COMPOSE_FILE" build --pull
docker compose -f "$PATIENT_APP_COMPOSE_FILE" up -d --remove-orphans
docker image prune -af
