require('dotenv/config');
const express = require('express');
const pg = require('pg');
const ClientError = require('./client-error');
const errorMiddleware = require('./error-middleware');
const staticMiddleware = require('./static-middleware');
const pathToSwaggerUi = require('swagger-ui-dist').absolutePath();
const cors = require('cors');
const db = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

const app = express();
const JSONMiddleware = express.json();

app.use(JSONMiddleware);
app.use(staticMiddleware);
app.use(cors());
app.use(express.static(pathToSwaggerUi));

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
app.use(errorMiddleware);

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${process.env.PORT}`);
});
