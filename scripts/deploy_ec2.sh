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

if [[ ! -d "$PATIENT_APP_APP_DIR" ]]; then
	echo "ERROR: PATIENT_APP_APP_DIR does not exist: $PATIENT_APP_APP_DIR" >&2
	exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
	echo "ERROR: docker is not installed on target host." >&2
	exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
	echo "ERROR: docker compose plugin is not available on target host." >&2
	exit 1
fi

cert_dir="/etc/letsencrypt/live/${PATIENT_APP_TLS_DOMAIN}"
if [[ ! -f "${cert_dir}/fullchain.pem" || ! -f "${cert_dir}/privkey.pem" ]]; then
	echo "ERROR: TLS certificate files are missing under ${cert_dir}" >&2
	exit 1
fi

cd "$PATIENT_APP_APP_DIR"

# Keep the server checkout aligned with the branch that triggered the deploy.
# Use a hard reset because the branch on the deploy host can diverge after
# force-pushes or local experimentation on the EC2 box.
git fetch origin "$TARGET_BRANCH" --prune
git checkout "$TARGET_BRANCH"
git reset --hard "origin/$TARGET_BRANCH"
git clean -fd

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
