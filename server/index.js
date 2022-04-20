require('dotenv/config');
const express = require('express');
const expressJSON = express.json();
const pg = require('pg');
const ClientError = require('./client-error');
const errorMiddleware = require('./error-middleware');
const sqlQueries = require('./sql-queries');
const fightersOutsource = require('./post-requests/fighters');
const movesOutsource = require('./post-requests/moves');
const movementsOutsource = require('./post-requests/movements');
const statsOutsource = require('./post-requests/stats');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');

const db = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

const app = express();
app.use('/api', expressJSON);
// app.use('/api/fighters/data', expressJSON);
// app.use('/api/fighters/data/:type', expressJSON);
// app.use('/api/add/fighters', expressJSON);
// app.use('/api/add/moves', expressJSON);
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

app.post('/api/add/fighters', (req, res, next) => {

  const { fighter, displayName } = req.body;
  let { rosterId } = req.body;
  rosterId = Number(rosterId);

  if (typeof fighter === 'string'
    & typeof rosterId === 'number'
    & typeof displayName === 'string') {
      const sql = `
        INSERT INTO public.fighters
        ("fighter", "rosterId", "displayName")
        VALUES ($1, $2, $3)
        RETURNING *;
      `;
    const params = [fighter, rosterId, displayName];
      return db.query(sql, params)
        .then(result => {
          res.status(201).json(result.rows[0]);
          console.log(result.rows[0]);
          })
        .catch(err => {
          if (/already exists/g.test(err.detail)) {
            res.status(400).json({ error: `${err.detail}`});
          } else {
            next(err);
          }
        });
  }
  res.status(500).json({ error: ':(' });
});

app.post('/api/add/moves', (req, res, next) => {
  // Check if they are undefined
  const { name, moveType, damage, activeFrames, totalFrames } = req.body;
  let { fighterId } = req.body;
  fighterId = Number(fighterId);
  const fullResult = {};
  if (!fighterId) {
    res.status(400).json({ error: 'fighterId must be a number'});
    return;
  }
  if (typeof fighterId === 'number'
    & typeof name === 'string'
    & typeof moveType === 'string'
    & typeof damage === 'string'
    & typeof activeFrames === 'string'
    & typeof totalFrames === 'string') {
      return handleMoves(1)
      function handleMoves (counter) {
        if (counter === 1) {
          const sql = `
          INSERT INTO public.moves
          ("fighterId", "name", "moveType", "type")
          VALUES ($1, $2, $3, 'move')
          RETURNING *;
          `;
          const params = [fighterId, name, moveType];
          return db.query(sql, params)
            .then(result => {
              Object.assign(fullResult, result.rows[0]);
              return handleMoves(counter + 1)
            })
            .catch(err => {
              if (/already exists/g.test(err.detail)
              || /not present/g.test(err.detail)) {
                res.status(400).json({ error: `${err.detail}` });
              } else {
                next(err);
              }
            });
        } else {
          const sql2 = `
            INSERT INTO public.hitboxes
              ("damage", "activeFrames", "totalFrames")
            VALUES ($1, $2, $3)
            RETURNING *;
          `;
          const params2 = [damage, activeFrames, totalFrames];
          return db.query(sql2, params2)
            .then(result => {
              Object.assign(fullResult, result.rows[0]);
              res.status(201).json(fullResult);
            })
            .catch(err => {
              if ((/already exists/g.test(err.detail))
              || (/not present/g.test(err.detail))) {
                res.status(400).json({ error: `${err.detail}` });
              } else {
                next(err);
              }
            });
        }
      }
  }
});

app.post('/api/add/throws', (req, res, next) => {
  const { name, damage, activeFrames, totalFrames } = req.body;
  let { fighterId } = req.body;
  fighterId = Number(fighterId);
  const fullResult = {};
  if (!fighterId) {
    res.status(400).json({ error: 'fighterId must be a number' });
    return;
  }
  if (typeof fighterId === 'number'
    & typeof name === 'string'
    & typeof damage === 'string'
    & typeof activeFrames === 'string'
    & typeof totalFrames === 'string') {
      return handleThrows(1)
      function handleThrows(counter) {
        if (counter === 1) {
          const sql = `
          INSERT INTO public.throws
            ("fighterId", "name", "type")
          VALUES ($1, $2, 'throw')
          RETURNING *;
          `;
          const params = [fighterId, name]
          return db.query(sql, params)
          .then(result => {
            Object.assign(fullResult, result.rows[0]);
            handleThrows(counter + 1)
          })
            .catch(err => {
              if (/already exists/g.test(err.detail)
                || /not present/g.test(err.detail)) {
                res.status(400).json({ error: `${err.detail}` });
              } else {
                next(err);
              }
            });
        } else {
          const sql2 = `
          INSERT INTO public.grappling
            ("damage", "activeFrames", "totalFrames")
          VALUES ($1, $2, $3)
          RETURNING *;
          `;
          const params2 = [damage, activeFrames, totalFrames];
          return db.query(sql2, params2)
            .then(result => {
              Object.assign(fullResult, result.rows[0]);
              res.status(201).json(fullResult)
            })
            .catch(err => {
              if (/already exists/g.test(err.detail)
                || /not present/g.test(err.detail)) {
                res.status(400).json({ error: `${err.detail}` });
              } else {
                next(err);
              }
            });
        }
      }
    }
});

app.post('/api/add/movements', (req, res, next) => {
  const { name, activeFrames, totalFrames } = req.body;
  let { fighterId } = req.body;
  fighterId = Number(fighterId);
  const fullResult = {};
  if (!fighterId) {
    res.status(400).json({ error: 'fighterId must be a number' });
    return;
  }
    if (typeof fighterId === 'number'
    & typeof name === 'string'
    & typeof activeFrames === 'string'
    & typeof totalFrames === 'string') {
      return handleMovements(1)
      function handleMovements(counter) {
        if (counter === 1) {
          const sql = `
          INSERT INTO public.movements
            ("fighterId", "name", "type")
          VALUES ($1, $2, 'movement')
          RETURNING *;
          `;
          const params = [fighterId, name]
          return db.query(sql, params)
          .then(result => {
            Object.assign(fullResult, result.rows[0]);
            handleMovements(counter + 1)
          })
            .catch(err => {
              if (/already exists/g.test(err.detail)
                || /not present/g.test(err.detail)) {
                res.status(400).json({ error: `${err.detail}` });
              } else {
                next(err);
              }
            });
        } else {
          const sql2 = `
          INSERT INTO public.dodging
            ("activeFrames", "totalFrames")
          VALUES ($1, $2)
          RETURNING *;
          `;
          const params2 = [activeFrames, totalFrames];
          return db.query(sql2, params2)
            .then(result => {
              Object.assign(fullResult, result.rows[0]);
              res.status(201).json(fullResult)
            })
            .catch(err => {
              if (/already exists/g.test(err.detail)
                || /not present/g.test(err.detail)) {
                res.status(400).json({ error: `${err.detail}` });
              } else {
                next(err);
              }
            });
        }
      }
    }
});

app.post('/api/add/stats', (req, res, next) => {
  const { name, statValue } = req.body;
  let { fighterId } = req.body;
  fighterId = Number(fighterId);
  const fullResult = {};
  if (!fighterId) {
    res.status(400).json({ error: 'fighterId must be a number' });
    return;
  }
  if (typeof fighterId === 'number'
    & typeof name === 'string'
    & typeof statValue === 'string') {
    return handleStats(1)
    function handleStats(counter) {
      if (counter === 1) {
        const sql = `
          INSERT INTO public.stats
            ("fighterId", "name", "type")
          VALUES ($1, $2, 'stat')
          RETURNING *;
          `;
        const params = [fighterId, name]
        return db.query(sql, params)
          .then(result => {
            Object.assign(fullResult, result.rows[0]);
            handleStats(counter + 1)
          })
          .catch(err => {
            if (/already exists/g.test(err.detail)
              || /not present/g.test(err.detail)) {
              res.status(400).json({ error: `${err.detail}` });
            } else {
              next(err);
            }
          });
      } else {
        const sql2 = `
          INSERT INTO public.miscellaneous
            ("statValue")
          VALUES ($1)
          RETURNING *;
          `;
        const params2 = [statValue];
        return db.query(sql2, params2)
          .then(result => {
            Object.assign(fullResult, result.rows[0]);
            res.status(201).json(fullResult)
          })
          .catch(err => {
            if (/already exists/g.test(err.detail)
              || /not present/g.test(err.detail)) {
              res.status(400).json({ error: `${err.detail}` });
            } else {
              next(err);
            }
          });
      }
    }
  }
});
app.use(errorMiddleware)

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${process.env.PORT}`);
});
