#!/usr/bin/env bash

set -euo pipefail

template_path="server/default_ec2.conf.template"
output_path="server/generated/default_ec2.conf"

: "${PATIENT_APP_DOMAIN:?PATIENT_APP_DOMAIN is required}"

server_name="${PATIENT_APP_SERVER_NAME:-$PATIENT_APP_DOMAIN}"

mkdir -p "$(dirname "$output_path")"

sed \
  -e "s|__PATIENT_APP_SERVER_NAME__|${server_name}|g" \
  -e "s|__PATIENT_APP_DOMAIN__|${PATIENT_APP_DOMAIN}|g" \
  "$template_path" > "$output_path"
