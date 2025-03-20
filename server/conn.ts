const Sequelize = require('sequelize');
const pg = require('pg');

export const client = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

export const sequelize = new Sequelize(process.env.DATABASE_URL, {
  host: 'localhost',
  dialect: 'postgres',
  logging: false,
  define: {
    timestamps: true
  }
});
