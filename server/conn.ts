import { getDatabaseUrl } from "./lib/getDatabaseUrl";
const Sequelize = require('sequelize');
const pg = require('pg');

export const client = new pg.Pool({
  connectionString: getDatabaseUrl(),
  ssl: {
    require: true,
    rejectUnauthorized: false
  }
});

export const sequelize = new Sequelize(getDatabaseUrl(), {
  dialect: 'postgres',
  dialectOptions: {
    ssl: {
      require: true,
      rejectUnauthorized: false
    }
  },
  logging: false,
});
