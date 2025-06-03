#!/bin/bash

DOMAIN=the-ultimate-api.dreseansutton.com
EMAIL=dreseansutton@gmail.com

echo "Stopping NGINX to free up port 80 for certbot"
systemctl stop nginx

if [ ! -f "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" ]; then
  echo "Requesting certificate for $DOMAIN"
  certbot certonly --standalone --non-interactive --agree-tos \
    -d $DOMAIN -m $EMAIL
else
  echo "Certificate already exists, skipping certbot"
fi
