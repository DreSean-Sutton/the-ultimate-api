require('dotenv/config');
const express = require('express');
const expressJSON = express.json();
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
app.use('/api', expressJSON);
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
    if (!Number(params)) {
      throw new ClientError(400, `fighterId must be an integer`);
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
    if (!Number(params)) {
      throw new ClientError(400, `rosterId must be an integer`);
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
      if (!Number(params)) {
        throw new ClientError(400, `fighterId must be an integer`);
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
      if (!Number(params)) {
        throw new ClientError(400, `rosterId must be an integer`);
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
    if (!Number(params)) {
      throw new ClientError(400, `fighterId must be an integer`);
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
    if (!Number(params)) {
      throw new ClientError(400, `rosterId must be an integer`);
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
  const reqParams = [fighter, displayName, rosterId]
  const isValid = reqParams.every(param => !!param);
  if(!isValid) {
    throw new ClientError(400, 'must have (fighter), (displayName), and (rosterId) as parameters');
  }
  const sql = `
    INSERT INTO public.fighters (
      "fighter", "rosterId", "displayName"
    )
    SELECT $1, $2, $3
    WHERE NOT EXISTS (
      SELECT 3
      FROM "fighters"
      WHERE "fighter"=$1
      OR "rosterId"=$2
      OR "displayName"=$3
    )
    RETURNING *;
    `;
    const params = [fighter, rosterId, displayName];
    return db.query(sql, params)
      .then(result => {
        if (result.rows.length === 0) {
          throw new ClientError(400, '(fighter), (rosterId), and (displayName) must all be unique')
        } else {
          res.status(201).json(result.rows[0]);
        }
        })
      .catch(err => next(err));
});

app.post('/api/add/moves/:fighterId', (req, res, next) => {
  const { name, moveType, damage, activeFrames, totalFrames } = req.body;
  if (/[A-Z]/gi.test(req.params.fighterId)
  & req.params.fighterId !== undefined) {
    throw new ClientError(400, 'fighterId must be a number');
    return;
  }
  const fighterId = Number(req.params.fighterId);
  const fullResult = {};
  const reqParams = [name, moveType, damage, activeFrames, totalFrames]
  const isValid = reqParams.every(param => !!param);
  if(!isValid) {
    throw new ClientError(400, 'must have (name), (moveType), (damage), (activeFrames), (totalFrames) as parameters');
  }
  const sql = `
    INSERT INTO public.moves (
      "fighterId", "name", "moveType", type
    )
    SELECT $1, $2, $3, 'moves'
    WHERE EXISTS (
        SELECT 1
          FROM "fighters"
        WHERE "fighterId"=$1
    )
    RETURNING *;
  `;
  const params = [fighterId, name, moveType];
  return db.query(sql, params)
  .then(result => {
    if (result.rows.length === 0) {
      throw new ClientError(404, `fighterId ${fighterId} doesn't exist`);
      return;
    }
    Object.assign(fullResult, result.rows[0]);
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
        .catch(err => next(err));
    })
    .catch(err => next(err));
});

app.post('/api/add/throws/:fighterId', (req, res, next) => {
  const { name, damage, activeFrames, totalFrames } = req.body;
  if (/[A-Z]/gi.test(req.params.fighterId)
  & req.params.fighterId !== undefined) {
    throw new ClientError(400, 'fighterId must be a number');
    return;
  }
  const fighterId = Number(req.params.fighterId);
  const fullResult = {};
  const reqParams = [name, damage, activeFrames, totalFrames]
  const isValid = reqParams.every(param => !!param);
  if(!isValid) {
    throw new ClientError(400, 'must have (name), (damage), (activeFrames), (totalFrames) as parameters');
  }
  const sql = `
    INSERT INTO public.throws (
      "fighterId", "name", "type"
    )
    SELECT $1, $2, 'throw'
    WHERE EXISTS (
      SELECT 1
      FROM "fighters"
      WHERE "fighterId"=$1
    )
    RETURNING *;
  `;
  const params = [fighterId, name]
  return db.query(sql, params)
  .then(result => {
    if (result.rows.length === 0) {
      throw new ClientError(404, `fighterId ${fighterId} doesn't exist`);
      return;
    }
    Object.assign(fullResult, result.rows[0]);
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
      .catch(err => next(err));
  })
    .catch(err => next(err));
});

app.post('/api/add/movements/:fighterId', (req, res, next) => {
  const { name, activeFrames, totalFrames } = req.body;
  if (/[A-Z]/gi.test(req.params.fighterId)
  & req.params.fighterId !== undefined) {
    throw new ClientError(400, 'fighterId must be a number');
    return;
  }
  const fighterId = Number(req.params.fighterId);
  const fullResult = {};
  const reqParams = [name, activeFrames, totalFrames]
  const isValid = reqParams.every(param => !!param);
  if(!isValid) {
    throw new ClientError(400, 'must have (name), (activeFrames), and (totalFrames) as parameters');
  }
  const sql = `
    INSERT INTO public.movements (
      "fighterId", "name", "type"
    )
    SELECT $1, $2, 'movement'
    WHERE EXISTS (
      SELECT 1
      FROM "fighters"
      WHERE "fighterId"=$1
    )
    RETURNING *;
  `;
  const params = [fighterId, name]
  return db.query(sql, params)
  .then(result => {
    if (result.rows.length === 0) {
      throw new ClientError(404, `fighterId ${fighterId} doesn't exist`);
      return;
    }
    Object.assign(fullResult, result.rows[0]);
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
      .catch(err => next(err));
  })
    .catch(err => next(err));
});

app.post('/api/add/stats/:fighterId', (req, res, next) => {
  const { name, statValue } = req.body;
  if (/[A-Z]/gi.test(req.params.fighterId)
  & req.params.fighterId !== undefined) {
    throw new ClientError(400, 'fighterId must be a number');
    return;
  }
  const fighterId = Number(req.params.fighterId);
  const fullResult = {};
  const reqParams = [name, statValue]
  const isValid = reqParams.every(param => !!param);
  if(!isValid) {
    throw new ClientError(400, 'must have (name), and (statValue) as parameters');
  }
  const sql = `
    INSERT INTO public.stats (
      "fighterId", "name", "type"
    )
    SELECT $1, $2, 'stat'
    WHERE EXISTS (
      SELECT 1
      FROM "fighters"
      WHERE "fighterId"=$1
    )
    RETURNING *;
    `;
  const params = [fighterId, name]
  return db.query(sql, params)
    .then(result => {
      if (result.rows.length === 0) {
        throw new ClientError(404, `fighterId ${fighterId} doesn't exist`);
        return;
      }
      Object.assign(fullResult, result.rows[0]);
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
        .catch(err => next(err));
    })
    .catch(err => next(err));
});

app.put('/api/update/fighters/:fighterId', (req, res, next) => {

  const { fighter, displayName } = req.body;
  let { rosterId } = req.body;
  if (/[A-Z]/gi.test(req.params.fighterId)
    & req.params.fighterId !== undefined) {
    throw new ClientError(400, 'fighterId must be a number');
    return;
  }
  if (/[A-Z]/gi.test(rosterId)
  & rosterId !== undefined) {
    throw new ClientError(400, 'rosterId must be a number');
    return;
  }
  const fighterId = Number(req.params.fighterId);
  const sql = `
    UPDATE
      public.fighters
    SET
      "fighter" = coalesce($2, "fighter"),
      "rosterId" = coalesce($3, "rosterId"),
      "displayName" = coalesce($4, "displayName")
    WHERE
      "fighterId"=$1
    RETURNING *;
  `;
  const params = [fighterId, fighter, rosterId, displayName];
  return db.query(sql, params)
    .then(result => {
      if (result.rows.length === 0) {
        throw new ClientError(404, `fighterId ${fighterId} does not exist`);
        return;
      }
      res.status(200).json(result.rows[0]);
    })
    .catch(err => next(err));
});

app.put('/api/update/moves/:moveId', (req, res, next) => {
  const { name, moveType, damage, activeFrames, totalFrames } = req.body;
  if (/[A-Z]/gi.test(req.params.moveId)
    & req.params.moveId !== undefined) {
    throw new ClientError(400, 'moveId must be a number');
    return;
  }
  const id = Number(req.params.moveId);
  fullResult = {};
  const sql = `
    UPDATE
      public.moves
    SET
      "name" = coalesce($2, "name"),
      "moveType" = coalesce($3, "moveType")
      WHERE
      "moveId"=$1
      RETURNING *;
    `;
    const params = [id, name, moveType];
    return db.query(sql, params)
      .then(result => {
        if (result.rows.length === 0) {
          throw new ClientError(404, `moveId ${id} does not exist`);
          return;
        }
        Object.assign(fullResult, result.rows[0]);
        const sql = `
          UPDATE
            public.hitboxes
          SET
            "damage" = coalesce($2, "damage"),
            "activeFrames" = coalesce($3, "activeFrames"),
            "totalFrames" = coalesce($4, "totalFrames")
          WHERE
            "moveId"=$1
          RETURNING *;
        `;
        const params = [id, damage, activeFrames, totalFrames];
        return db.query(sql, params)
          .then(result => {
            Object.assign(fullResult, result.rows[0]);
            res.status(200).json(fullResult);
          })
          .catch(err => next(err));
      })
      .catch(err => next(err))
});

app.put('/api/update/throws/:throwId', (req, res, next) => {
  const { name, damage, activeFrames, totalFrames } = req.body;
  if (/[A-Z]/gi.test(req.params.throwId)
    & req.params.throwId !== undefined) {
    throw new ClientError(400, 'throwId must be a number');
    return;
  }
  const id = Number(req.params.throwId);
  fullResult = {};
  const sql = `
    UPDATE
      public.throws
    SET
      "name" = coalesce($2, "name")
    WHERE
      "throwId"=$1
    RETURNING *;
  `;
  const params = [id, name];
  return db.query(sql, params)
    .then(result => {
      if (result.rows.length === 0) {
        throw new ClientError(404, `throwId ${id} does not exist`);
        return;
      }
      Object.assign(fullResult, result.rows[0]);
      const sql = `
        UPDATE
            public.grappling
        SET
          "damage" = coalesce($2, "damage"),
          "activeFrames" = coalesce($3, "activeFrames"),
          "totalFrames" = coalesce($4, "totalFrames")
        WHERE
          "throwId"=$1
        RETURNING *;
      `;
      const params = [id, damage, activeFrames, totalFrames];
      return db.query(sql, params)
        .then(result => {
          if (result.rows.length === 0) {
            throw new ClientError(404, `throwId ${id} does not exist`);
            return;
          }
          Object.assign(fullResult, result.rows[0]);
          res.status(200).json(fullResult);
        })
        .catch(err => next(err));
    })
    .catch(err => next(err));
});

app.put('/api/update/movements/:movementsId', (req, res, next) => {
  const { name, activeFrames, totalFrames } = req.body;
  if (/[A-Z]/gi.test(req.params.movementsId)
    & req.params.movementsId !== undefined) {
    throw new ClientError(400, 'movementId must be a number');
    return;
  }
  const id = Number(req.params.movementsId);
  fullResult = {};
  const sql = `
    UPDATE
      public.movements
    SET
      "name" = coalesce($2, "name")
    WHERE
      "movementId"=$1
    RETURNING *;
  `;
  const params = [id, name];
  return db.query(sql, params)
    .then(result => {
      if (result.rows.length === 0) {
        throw new ClientError(404, `movementId ${id} does not exist`);
        return;
      }
      Object.assign(fullResult, result.rows[0]);
      const sql = `
        UPDATE
            public.dodging
        SET
          "activeFrames" = coalesce($2, "activeFrames"),
          "totalFrames" = coalesce($3, "totalFrames")
        WHERE
          "movementId"=$1
        RETURNING *;
      `;
      const params = [id, activeFrames, totalFrames];
      return db.query(sql, params)
        .then(result => {
          if (result.rows.length === 0) {
            throw new ClientError(404, `movementId ${id} does not exist`);
            return;
          }
          Object.assign(fullResult, result.rows[0]);
          res.status(200).json(fullResult);
        })
        .catch(err => next(err));
    })
    .catch(err => next(err));
});

app.put('/api/update/stats/:statId', (req, res, next) => {
  const { name, statValue } = req.body;
  if (/[A-Z]/gi.test(req.params.statId)
    & req.params.statId !== undefined) {
    throw new ClientError(400, 'statId must be a number');
    return;
  }
  const id = Number(req.params.statId);
  fullResult = {};
  const sql = `
    UPDATE
      public.stats
    SET
      "name" = coalesce($2, "name")
    WHERE
      "statId"=$1
    RETURNING *;
  `;
  const params = [id, name];
  return db.query(sql, params)
    .then(result => {
      if (result.rows.length === 0) {
        throw new ClientError(404, `statId ${id} does not exist`);
        return;
      }
      Object.assign(fullResult, result.rows[0]);
      const sql = `
        UPDATE
          public.miscellaneous
        SET
          "statValue" = coalesce($2, "statValue")
        WHERE
          "statId"=$1
        RETURNING *;
      `;
      const params = [id, statValue];
      return db.query(sql, params)
        .then(result => {
          if (result.rows.length === 0) {
            throw new ClientError(404, `statId ${id} does not exist`);
            return;
          }
          Object.assign(fullResult, result.rows[0]);
          res.status(200).json(fullResult);
        })
        .catch(err => next(err));
    })
    .catch(err => next(err));
});

app.delete('/api/delete/fighters/:fighterId', (req, res, next) => {
  // Set it up so that you only have one delete route that conditionally
  // goes through each group of tables and deletes them conditionally

  if (/[A-Z]/gi.test(req.params.fighterId)
    & req.params.fighterId !== undefined) {
    throw new ClientError(400, 'fighterId must be a number');
    return;
  }
  const id = Number(req.params.fighterId);
  fullResult = {};
  const sql = `
    DELETE FROM
      public.fighters
    WHERE
      "fighterId"=$1
      RETURNING "fighterId";
  `;
  const params = [id]
  return db.query(sql, params)
    .then(result => {
      res.status(204).json(result.rows[0]);
    })
    .catch(err => next(err));
});

app.delete('/api/delete/moves/:moveId', (req, res, next) => {
  if (/[A-Z]/gi.test(req.params.moveId)
    & req.params.moveId !== undefined) {
    throw new ClientError(400, 'moveId must be a number');
    return;
  }
  const id = Number(req.params.moveId);
  fullResult = {};
  const sql = `
  DELETE FROM
    public.moves
  WHERE
    "fighter
  `
});
app.use(errorMiddleware);

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${process.env.PORT}`);
});
