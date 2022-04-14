require('dotenv/config');
const express = require('express');
const pg = require('pg');
const errorMiddleware = require('./error-middleware')
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');

const db = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

const app = express();
const swaggerDocument = YAML.load('./openapi.yml');

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
    res.status(200).send(result.rows);
  })
  .catch(err => next(err));
});

app.get('/api/fighters/:identifier', (req, res, next) => {
  console.error('hello!');
  console.error(req.params.identifier);
  const sql = `
  SELECT
    "fighterId", "fighter",
    "rosterId", "displayName"
  FROM
    "fighters"
  WHERE
    "fighter"=$1
  OR
    "fighterId"=$1
  OR
    "rosterId"=$1
  `;
  const params = [req.params.identifier]
  db.query(sql, params)
    .then(result => {
      res.status(200).send(result.rows)
    })
    .catch(err => next(err))
});

app.use(errorMiddleware)
app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${process.env.PORT}`);
});
