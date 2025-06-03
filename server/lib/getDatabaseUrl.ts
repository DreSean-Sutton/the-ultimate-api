export function getDatabaseUrl(): string {
  const {
    RDS_HOSTNAME,
    RDS_PORT,
    RDS_DB_NAME,
    RDS_USERNAME,
    RDS_PASSWORD,
    DATABASE_URL
  } = process.env;

  if (DATABASE_URL) {
    console.log('Using DATABASE_URL from environment variables');
    return DATABASE_URL;
  }

  if (!RDS_HOSTNAME || !RDS_PORT || !RDS_DB_NAME || !RDS_USERNAME || !RDS_PASSWORD) {
    throw new Error('Missing required environment variables for DB connection.');
  }

  return `postgres://${RDS_USERNAME}:${RDS_PASSWORD}@${RDS_HOSTNAME}:${RDS_PORT}/${RDS_DB_NAME}`;
}
