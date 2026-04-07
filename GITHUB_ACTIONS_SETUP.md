# Patient App GitHub Actions Setup

This repo now includes GitHub Actions for:

- CI validation
- EC2 deployment for `dev` and `staging`
- AWS static production deployment for `prod`

## Workflows

- `.github/workflows/ci.yml`
  - runs Flutter install, analyze, test, web build, and Docker build validation
- `.github/workflows/deploy-ec2.yml`
  - deploys to EC2 for `dev` and `staging`
  - branch mapping:
    - `develop` -> `dev`
    - `staging` -> `staging`
  - also supports manual `workflow_dispatch`
- `.github/workflows/deploy-aws-prod-static.yml`
  - manual production deployment to AWS S3 + CloudFront

## GitHub Environments

Create these GitHub Environments:

- `dev`
- `staging`
- `prod`

Recommended AWS region mapping:

- `dev` -> `us-east-1` (N. Virginia)
- `staging` -> `us-west-1` (N. California)
- `prod` -> `us-west-2` (Oregon)

## Required Secrets and Variables

### `dev` environment

Secrets:

- `EC2_SSH_PRIVATE_KEY`

Variables:

- `EC2_HOST`
- `EC2_USER`
- `EC2_APP_DIR`
- `PATIENT_APP_DOMAIN`
- `PATIENT_APP_TLS_DOMAIN`
- `PATIENT_APP_SERVER_NAME`
- `PATIENT_APP_URL`

### `staging` environment

Secrets:

- `EC2_SSH_PRIVATE_KEY`

Variables:

- `EC2_HOST`
- `EC2_USER`
- `EC2_APP_DIR`
- `PATIENT_APP_DOMAIN`
- `PATIENT_APP_TLS_DOMAIN`
- `PATIENT_APP_SERVER_NAME`
- `PATIENT_APP_URL`

### `prod` environment

Variables:

- `AWS_ROLE_TO_ASSUME`
- `AWS_REGION`
- `AWS_S3_BUCKET`
- `AWS_CLOUDFRONT_DISTRIBUTION_ID`
- `PATIENT_APP_URL`

## EC2 Expectations

The EC2 host must already have:

- Docker installed
- Docker Compose plugin installed
- the repo cloned to `EC2_APP_DIR`
- SSH access for the GitHub Actions deploy key
- certificate files present under:
  - `/etc/letsencrypt/live/<PATIENT_APP_TLS_DOMAIN>/fullchain.pem`
  - `/etc/letsencrypt/live/<PATIENT_APP_TLS_DOMAIN>/privkey.pem`

## If You Don't Have Final Domain Yet

You can use Cloudflare test subdomains on `addtocloud.tech` immediately.

Recommended temporary mapping:

- `dev` -> `patient-dev.addtocloud.tech`
- `staging` -> `patient-staging.addtocloud.tech`

Set these in each GitHub Environment:

- `PATIENT_APP_DOMAIN=<subdomain>`
- `PATIENT_APP_TLS_DOMAIN=<subdomain>`
- `PATIENT_APP_SERVER_NAME=<subdomain>`
- `PATIENT_APP_URL=https://<subdomain>`

Cloudflare DNS records (per environment):

- Type: `A`
- Name: `patient-dev` or `patient-staging`
- Content: `<EC2_PUBLIC_IP>`
- Proxy status: `DNS only` while issuing Let's Encrypt certificates

Issue cert on each EC2 host before first deploy:

```bash
sudo certbot certonly --standalone -d patient-dev.addtocloud.tech
sudo certbot certonly --standalone -d patient-staging.addtocloud.tech
```

After certs exist and HTTPS is working, you can enable Cloudflare proxy if needed.

## Current Environment File Mapping

The workflows currently use the repo's existing Flutter define files:

- `dev` -> `env/dev_env.json`
- `staging` -> `env/prod_dev_env.json`
- `prod` -> `env/prod_env.json`

Important note:

- Flutter web embeds these values at build time
- anything built into the frontend should be treated as public
- move sensitive values out of frontend build-time config before production hardening

## Production Hosting Pattern

For this Flutter web app, the lower-error production pattern is:

- private S3 bucket in `us-west-2`
- CloudFront in front of the bucket using Origin Access Control
- Cloudflare DNS pointing to CloudFront
- manual production promotion from GitHub Actions using OIDC

Recommended infra settings:

- ACM certificate for CloudFront in `us-east-1`
- CloudFront default root object: `index.html`
- SPA fallback at CloudFront for `403/404 -> /index.html`
- S3 Block Public Access enabled
- versioned bucket or backup retention enabled
