require('dotenv/config');
const express = require('express');
const pg = require('pg');
const db = new pg.Pool({
  const swaggerUi = require('swagger-ui-express');
  const YAML = require('yamljs');
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

const app = express();
const swaggerDocument = YAML.load('./swagger.yaml');

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
app.get('/api/fighters', (req, res, next) => {
  const sql = `
  SELECT
    "fighterId", "fighter",
    "rosterId", "displayName"
  FROM
    "fighters"
  `;
  db.query(sql)
    .then(result => {
      res.status(200).json(result.rows);
    })
    .catch(err => next(err));
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${process.env.PORT}`);
});
