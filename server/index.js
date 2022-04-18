require('dotenv/config');
const express = require('express');
const pg = require('pg');
const ClientError = require('./client-error');
const errorMiddleware = require('./error-middleware');
const sqlQueries = require('./sql-queries');
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
    ${sqlQueries.getFighters()}
    WHERE
      fighter=$1
    `;
    const params = [queryStr.fighter];
    if (/\d/g.test(params)) {
      throw new ClientError(400, `fighter name can't have a number`);
    }
    return db.query(sql, params)
    .then(result => {
    if (result.rows.length === 0) {
      throw new ClientError(404, `${queryKey} named ${params} doesn't exist in the database`)
    }
      res.status(200).send(result.rows[0]);
    })
    .catch(err => next(err));
  }
  if (queryStr.fighterId) {
    const sql = `
    ${sqlQueries.getFighters()}
    WHERE
      "fighterId"=$1
    `;
    const params = [queryStr.fighterId];
    if (/[A-Za-z]/gi.test(params)) {
      throw new ClientError(400, `fighterId can't contain any letters`);
    }
    return db.query(sql, params)
      .then(result => {
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`)
      }
        res.status(200).send(result.rows[0]);
      })
      .catch(err => next(err));
  }
  if (queryStr.rosterId) {
    const sql = `
    ${sqlQueries.getFighters()}
    WHERE
      "rosterId"=$1
    `;
    const params = [queryStr.rosterId];
    if (/[A-Za-z]/gi.test(params)) {
      throw new ClientError(400, `rosterId can't contain any letters`);
    }
    return db.query(sql, params)
      .then(result => {
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`)
      }
        res.status(200).send(result.rows[0]);
      })
      .catch(err => next(err));
  }
  if (queryStr.orderByRosterId) {
    const sql = `
    ${sqlQueries.getFighters()}
    ORDER BY
    "rosterId"
    `;
    return db.query(sql)
    .then(result => {
      res.status(200).send(result.rows);
    })
    .catch(err => next(err));
  }
  if (queryKey.length > 0) {
    throw new ClientError(400, `${queryKey} is not a valid query key`)
  }
  const sql = `${sqlQueries.getFighters()}`;
  return db.query(sql)
    .then(result => {
      res.status(200).send(result.rows);
    })
    .catch(err => next(err));
});

app.get('/api/fighters/data', (req, res, next) => {
  const fullResult = [];
  return renderAllData(0, fullResult)
  // This sends a sql query for each data type in the database
  // and responds with a single array of all data.

  function renderAllData (index, fullResult) {
    const dataTypes = ['moves', 'throws', 'movements', 'stats'];
    const dataTypeIds = ['moveId', 'throwId', 'movementId', 'statId'];

    if (dataTypes.length === index) {
      return res.status(200).send(fullResult.flat(1));
    }
    const queryStr = req.query;
    const queryKey = Object.keys(queryStr);
    if (queryStr.fighter) {
      const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      fighter=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
      const params = [queryStr.fighter];
      if (/\d/g.test(params)) {
        throw new ClientError(400, `fighter name can't have a number`);
      }
      return db.query(sql, params)
      .then(result => {
        if (result.rows.length === 0) {
          throw new ClientError(404, `${queryKey} named ${params} doesn't exist in the database`)
        }
        fullResult.push(result.rows)
        renderAllData(index + 1, fullResult)
      })
      .catch(err => next(err));
    }
    if (queryStr.fighterId) {
      const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      "fighterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
      const params = [queryStr.fighterId];
      if (/[A-Za-z]/gi.test(params)) {
        throw new ClientError(400, `fighterId can't contain any letters`);
      }
      return db.query(sql, params)
      .then(result => {
        if (result.rows.length === 0) {
          throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`)
        }
        fullResult.push(result.rows);
        renderAllData(index + 1, fullResult);
      })
      .catch(err => next(err));
    }
    if (queryStr.rosterId) {
      const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      "rosterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
      const params = [queryStr.rosterId];
      if (/[A-Za-z]/gi.test(params)) {
        throw new ClientError(400, `rosterId can't contain any letters`);
      }
      return db.query(sql, params)
      .then(result => {
        if (result.rows.length === 0) {
          throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`)
        }
        fullResult.push(result.rows);
        renderAllData(index + 1, fullResult);
      })
      .catch(err => next(err));
    }
    if (queryStr.orderByRosterId) {
      const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      ORDER BY
      "rosterId", ${JSON.stringify(dataTypeIds[index])}
      `;
      return db.query(sql)
      .then(result => {
        fullResult.push(result.rows);
        renderAllData(index + 1, fullResult);
      })
      .catch(err => next(err));
    }
    if (queryKey.length > 0) {
      throw new ClientError(400, `${queryKey} is not a valid query key`)
    }
    const sql = `
    ${sqlQueries.getFightersData(dataTypes[index])}
    ORDER BY ${JSON.stringify(dataTypeIds[index])}
    `;
    return db.query(sql)
      .then(result => {
        fullResult.push(result.rows);
        renderAllData(index + 1, fullResult);
      })
    .catch(err => next(err));
  }
});

app.get('/api/fighters/data/:type', (req, res, next) => {
  const queryStr = req.query;
  const queryKey = Object.keys(queryStr);
  const currentType = req.params.type;
  let index = null
  const dataTypes = ['moves', 'throws', 'movements', 'stats'];
  const dataTypeIds = ['moveId', 'throwId', 'movementId', 'statId'];

  if (!checkValidType()) {
    throw new ClientError(400, `${currentType} is not a valid parameter`);
  }
  if (queryStr.fighter) {
    const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      fighter=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
    const params = [queryStr.fighter];
    if (/\d/g.test(params)) {
      throw new ClientError(400, `fighter name can't have a number`);
    }
    return db.query(sql, params)
      .then(result => {
        if (result.rows.length === 0) {
          throw new ClientError(404, `${queryKey} named ${params} doesn't exist in the database`)
        }
        res.status(200).send(result.rows);
      })
      .catch(err => next(err));
  }
  if (queryStr.fighterId) {
    const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      "fighterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
    const params = [queryStr.fighterId];
    if (/[A-Za-z]/gi.test(params)) {
      throw new ClientError(400, `fighterId can't contain any letters`);
    }
    return db.query(sql, params)
      .then(result => {
        if (result.rows.length === 0) {
          throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`)
        }
        res.status(200).send(result.rows);
      })
      .catch(err => next(err));
  }
  if (queryStr.rosterId) {
    const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      "rosterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
    const params = [queryStr.rosterId];
    if (/[A-Za-z]/gi.test(params)) {
      throw new ClientError(400, `rosterId can't contain any letters`);
    }
    return db.query(sql, params)
      .then(result => {
        if (result.rows.length === 0) {
          throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`)
        }
        res.status(200).send(result.rows);
      })
      .catch(err => next(err));
  }
  if (queryStr.orderByRosterId) {
    const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      ORDER BY
      "rosterId", ${JSON.stringify(dataTypeIds[index])}
      `;
    return db.query(sql)
      .then(result => {
        res.status(200).send(result.rows);
      })
      .catch(err => next(err));
  }
  if (queryKey.length > 0) {
    throw new ClientError(400, `${queryKey} is not a valid query key`)
  }
  const sql = `
    ${sqlQueries.getFightersData(dataTypes[index])}
    ORDER BY ${JSON.stringify(dataTypeIds[index])}
    `;
  return db.query(sql)
    .then(result => {
      res.status(200).send(result.rows)
    })
    .catch(err => next(err));

  function checkValidType() {
    for (let i = 0; i < dataTypes.length; i++) {
      if (currentType === dataTypes[i]) {
        index = i
        return true;
      }
    }
    return false;
  }
});

app.use(errorMiddleware)

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${process.env.PORT}`);
});
