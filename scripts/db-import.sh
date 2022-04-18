#!/bin/sh

set -e

# shellcheck source=/dev/null
test -f .env && . .env

psql "$DATABASE_URL" -f database/schema.sql -f database/fighters-data.sql -f database/moves-data.sql -f database/hitboxes-data.sql -f database/throws-data.sql -f database/grappling-data.sql -f database/movements-data.sql -f database/dodging-data.sql
