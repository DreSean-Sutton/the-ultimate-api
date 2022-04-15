require('dotenv/config');
const express = require('express');
const pg = require('pg');
const ClientError = require('./client-error');
const errorMiddleware = require('./error-middleware');
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
  const queryStr = req.query;
  const queryKey = Object.keys(queryStr)
  if (queryStr.fighter) {
    const sql = `
    SELECT
      fighter_id, fighter,
      roster_id, display_name
    FROM
      fighters
    WHERE
      fighter=$1
    `;
    const params = [queryStr.fighter];
    console.log(params);
    return db.query(sql, params)
    .then(result => {
    if (result.rows.length === 0)
    throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`)
      res.status(200).send(result.rows[0]);
    })
    .catch(err => next(err));
  }
  if (queryStr.fighter_id) {
    const sql = `
    SELECT
      fighter_id, fighter,
      roster_id, display_name
    FROM
      fighters
    WHERE
      fighter_id=$1
    `;
    const params = [queryStr.fighter_id];
    console.log(params);
    return db.query(sql, params)
      .then(result => {
      if (result.rows.length === 0)
        throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`)
        res.status(200).send(result.rows[0]);
      })
      .catch(err => next(err));
  }
  if (queryStr.roster_id) {
    const sql = `
    SELECT
      fighter_id, fighter,
      roster_id, display_name
    FROM
      fighters
    WHERE
      roster_id=$1
    `;
    const params = [queryStr.roster_id];
    console.log(params);
    return db.query(sql, params)
      .then(result => {
      if (result.rows.length === 0)
        throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`)
        res.status(200).send(result.rows[0]);
      })
      .catch(err => next(err));
  }
  console.error(queryKey)
  if (queryKey.length > 0) {
    throw new ClientError(400, `${queryKey} is not a valid query key`)
  }
  const sql = `
    SELECT
      fighter_id, fighter,
      roster_id, display_name
    FROM
      fighters
    `;
  return db.query(sql)
    .then(result => {
      res.status(200).send(result.rows);
    })
    .catch(err => next(err));
});

app.use(errorMiddleware)
app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${process.env.PORT}`);
});
