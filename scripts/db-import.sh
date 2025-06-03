#!/bin/sh
# if [ -f /tmp/db-imported.flag ]; then
#   echo "DB already imported — skipping."
#   exit 0
# fi

set -e

echo "Starting database import..."

# If running locally and .env exists, source it
if [ -f .env ]; then
  echo "Loading .env"
  . .env
fi

# Build connection string
if [ -n "$DATABASE_URL" ]; then
  echo "Using DATABASE_URL"
  PSQL_CMD="psql \"$DATABASE_URL\" -v ON_ERROR_STOP=1"
elif [ -n "$RDS_HOSTNAME" ]; then
  echo "Using RDS environment variables"
  PSQL_CMD="PGPASSWORD=$RDS_PASSWORD psql -h \"$RDS_HOSTNAME\" -p \"$RDS_PORT\" -U \"$RDS_USERNAME\" -d \"$RDS_DB_NAME\""
else
  echo "No database configuration found. Exiting."
  exit 1
fi

# Run import
eval $PSQL_CMD \
  -f database/schema.sql \
  -f database/fighters-data.sql \
  -f database/moves/moves-data.sql \
  -f database/moves/hitboxes-data.sql \
  -f database/throws/throws-data.sql \
  -f database/throws/grappling-data.sql \
  -f database/movements/movements-data.sql \
  -f database/movements/dodging-data.sql \
  -f database/stats/stats-data.sql \
  -f database/stats/miscellaneous-data.sql

echo "Finished database import."
touch /tmp/db-imported.flag
