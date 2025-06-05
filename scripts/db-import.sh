#!/bin/sh
set -e

echo "Starting database import..."


# Load .env in dev
if [ -f .env ]; then
  echo "Loading .env"
  . .env
fi

# Combine SQL into transaction and import
if [ -n "$DATABASE_URL" ]; then
  echo "Using DATABASE_URL"
  (echo "BEGIN;";
   cat \
     database/schema.sql \
     database/fighters-data.sql \
     database/moves/moves-data.sql \
     database/moves/hitboxes-data.sql \
     database/throws/throws-data.sql \
     database/throws/grappling-data.sql \
     database/movements/movements-data.sql \
     database/movements/dodging-data.sql \
     database/stats/stats-data.sql \
     database/stats/miscellaneous-data.sql;
   echo "COMMIT;") | psql "$DATABASE_URL" -v ON_ERROR_STOP=1
elif [ -n "$RDS_HOSTNAME" ]; then
  echo "Using RDS env vars"
  (echo "BEGIN;";
   cat \
     database/schema.sql \
     database/fighters-data.sql \
     database/moves/moves-data.sql \
     database/moves/hitboxes-data.sql \
     database/throws/throws-data.sql \
     database/throws/grappling-data.sql \
     database/movements/movements-data.sql \
     database/movements/dodging-data.sql \
     database/stats/stats-data.sql \
     database/stats/miscellaneous-data.sql;
   echo "COMMIT;") | PGPASSWORD=$RDS_PASSWORD psql \
     -h "$RDS_HOSTNAME" \
     -p "$RDS_PORT" \
     -U "$RDS_USERNAME" \
     -d "$RDS_DB_NAME" \
     -v ON_ERROR_STOP=1
else
  echo "No DB config found. Exiting."
  exit 1
fi

echo "Finished database import."
