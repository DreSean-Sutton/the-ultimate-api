#!/bin/sh

set -e

# shellcheck source=/dev/null
test -f .env && . .env

psql "$DATABASE_URL" -f database/schema.sql -f database/fighters-data.sql -f database/moves/moves-data.sql -f database/moves/hitboxes-data.sql -f database/throws/throws-data.sql -f database/throws/grappling-data.sql -f database/movements/movements-data.sql -f database/movements/dodging-data.sql -f database/stats/stats-data.sql -f database/stats/miscellaneous-data.sql
