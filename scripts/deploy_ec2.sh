#!/usr/bin/env bash

set -euo pipefail

# This script is intentionally small:
# 1. update the checked-out branch on the target EC2 host
# 2. load a prebuilt image (when provided)
# 3. restart the non-prod service with Docker Compose

: "${PATIENT_APP_APP_DIR:?PATIENT_APP_APP_DIR is required}"
: "${TARGET_BRANCH:?TARGET_BRANCH is required}"
: "${PATIENT_APP_ENV:?PATIENT_APP_ENV is required}"
: "${PATIENT_APP_ENV_FILE:?PATIENT_APP_ENV_FILE is required}"
: "${PATIENT_APP_DOMAIN:?PATIENT_APP_DOMAIN is required}"

PATIENT_APP_SERVER_NAME="${PATIENT_APP_SERVER_NAME:-$PATIENT_APP_DOMAIN}"
PATIENT_APP_TLS_DOMAIN="${PATIENT_APP_TLS_DOMAIN:-$PATIENT_APP_DOMAIN}"
PATIENT_APP_COMPOSE_FILE="${PATIENT_APP_COMPOSE_FILE:-docker-compose-gha.yaml}"
PATIENT_APP_CONTAINER_NAME="${PATIENT_APP_CONTAINER_NAME:-patient_app_${PATIENT_APP_ENV}}"
PATIENT_APP_IMAGE="${PATIENT_APP_IMAGE:-}"
PATIENT_APP_IMAGE_TAR="${PATIENT_APP_IMAGE_TAR:-}"

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
if ! sudo -n test -L "${cert_dir}/fullchain.pem" || ! sudo -n test -L "${cert_dir}/privkey.pem"; then
	echo "ERROR: TLS certificate files are missing or unreadable under ${cert_dir}" >&2
	echo "HINT: ensure ubuntu has non-interactive sudo and letsencrypt path access." >&2
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

export PATIENT_APP_ENV_FILE
export PATIENT_APP_NGINX_FILE="generated/default_ec2.conf"
export PATIENT_APP_TLS_DOMAIN
export PATIENT_APP_CONTAINER_NAME
export PATIENT_APP_IMAGE

if [[ -n "$PATIENT_APP_IMAGE_TAR" ]]; then
	echo "INFO: loading prebuilt image bundle ${PATIENT_APP_IMAGE_TAR}"
	if [[ ! -f "$PATIENT_APP_IMAGE_TAR" ]]; then
		echo "ERROR: PATIENT_APP_IMAGE_TAR does not exist: $PATIENT_APP_IMAGE_TAR" >&2
		exit 1
	fi

	gunzip -c "$PATIENT_APP_IMAGE_TAR" | docker load
	rm -f "$PATIENT_APP_IMAGE_TAR"
fi

# Validate Compose before touching running containers.
echo "INFO: validating compose file ${PATIENT_APP_COMPOSE_FILE}"
docker compose -f "$PATIENT_APP_COMPOSE_FILE" config >/dev/null

if [[ -n "$PATIENT_APP_IMAGE" ]]; then
	echo "INFO: starting containers from prebuilt image ${PATIENT_APP_IMAGE} (timeout: 10m)"
	timeout 10m docker compose -f "$PATIENT_APP_COMPOSE_FILE" up -d --remove-orphans --pull never
else
	echo "INFO: no prebuilt image provided; building on host (timeout: 30m)"
	timeout 30m docker compose -f "$PATIENT_APP_COMPOSE_FILE" build --pull
	echo "INFO: starting containers (timeout: 10m)"
	timeout 10m docker compose -f "$PATIENT_APP_COMPOSE_FILE" up -d --remove-orphans
fi

docker image prune -f
