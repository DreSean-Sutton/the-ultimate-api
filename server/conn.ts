// const pg = require('pg');

// export const db = new pg.Pool({
//   connectionString: process.env.DATABASE_URL,
//   ssl: {
//     rejectUnauthorized: false
//   }
// });

const { Client } = require('pg');
export const client = new Client({
  // user: 'dbuser',
  host: process.env.DATABASE_URL,
  database: 'smash_ultimate',
  // password: 'secretpassword',
  port: 5432,
});
