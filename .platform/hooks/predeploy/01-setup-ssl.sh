#!/bin/bash

set -e

DOMAIN=the-ultimate-api.dreseansutton.com
EMAIL=dreseansutton@gmail.com

echo "Stopping NGINX to free up port 80 for Certbot"
systemctl stop nginx || true

# Ensure certbot is installed manually
if ! command -v certbot >/dev/null 2>&1; then
  echo "Installing certbot manually..."
  yum install -y python3-certbot
fi

# Issue certificate if it doesn't exist
if [ ! -f "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" ]; then
  echo "Requesting certificate for $DOMAIN"
  certbot certonly --standalone --non-interactive --agree-tos \
    -d "$DOMAIN" -m "$EMAIL"
else
  echo "Certificate already exists, skipping certbot"
fi
