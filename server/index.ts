import { type } from "os";

require('dotenv/config');
const express = require('express');
const expressJSON = express.json();
const pg = require('pg');
import ClientError from "./client-error";
import errorMiddleware from "./error-middleware";
const staticMiddleware = require('./static-middleware');
const sqlQueries = require('./sql-queries');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const cors = require('cors');

const db = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

const app = express();
app.use(cors());
app.use('/api', expressJSON);
const swaggerDocument = YAML.load('./openapi.yml');

app.use(staticMiddleware);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.get('/api/fighters', async (req: any, res: any, next: any) => {
  const queryStr = req.query;
  const queryKey = Object.keys(queryStr);
  if (queryStr.fighter) {
    const sql = `
    ${sqlQueries.getFighters()}
    WHERE
      fighter=$1
    `;
    const params: any = [queryStr.fighter];
    try {
      if (/\d/g.test(params)) {
        throw new ClientError(400, 'fighter name can\'t have a number');
      }
      const result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} named ${params} doesn't exist in the database`);
      }
      return res.status(200).send(result.rows[0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.fighterId) {
    const sql = `
    ${sqlQueries.getFighters()}
    WHERE
      "fighterId"=$1
    `;
    try {
      const params = [queryStr.fighterId];
      if (!Number(params)) {
        throw new ClientError(400, 'fighterId must be an integer');
      }
      const result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`);
      }
      return res.status(200).send(result.rows[0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.rosterId) {
    const sql = `
    ${sqlQueries.getFighters()}
    WHERE
      "rosterId"=$1
    `;
    const params = [queryStr.rosterId];
    try {
      if (!Number(params)) {
        throw new ClientError(400, 'rosterId must be an integer');
      }
      const result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`);
      }
      return res.status(200).send(result.rows[0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.orderByRosterId) {
    try {
      if (queryStr.orderByRosterId !== 'true') {
        throw new ClientError(400, 'orderByRosterId must be true');
      }
      const sql = `
      ${sqlQueries.getFighters()}
      ORDER BY
      "rosterId"
      `;
      const result = await db.query(sql);
      return res.status(200).send(result.rows);
    } catch (e) {
      return next(e);
    }
  }
  try {
    if (queryKey.length > 0) {
      throw new ClientError(400, `${queryKey} is not a valid query key`);
    }
    const sql = `${sqlQueries.getFighters()}`;
    const result = await db.query(sql);
    return res.status(200).send(result.rows);
  } catch (e) {
    return next(e);
  }
});

app.get('/api/fighters/data', async (req: any, res: any, next: any) => {
  const fullResult: any = [];
  return renderAllData(0, fullResult);

  async function renderAllData(index: number, fullResult: any): Promise<any> {
    type MyType = {
      rows: any
    }
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
      const params: any = [queryStr.fighter];
      try {
        if (/\d/g.test(params)) {
          throw new ClientError(400, 'fighter name can\'t have a number');
        }
        const result: any = await db.query(sql, params);
        if (result.rows.length === 0) {
          throw new ClientError(404, `${queryKey} named ${params} doesn't exist in the database`);
        }
          fullResult.push(result.rows);
        return renderAllData(index + 1, fullResult);
      } catch (e) {
        return next(e);
      }
    }
    if (queryStr.fighterId) {
      const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      "fighterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
      const params = [queryStr.fighterId];
      try {
        if (!Number(params)) {
          throw new ClientError(400, 'fighterId must be an integer');
        }
        const result = await db.query(sql, params);
        if (result.rows.length === 0) {
          throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`);
        }
        fullResult.push(result.rows);
        return renderAllData(index + 1, fullResult);
      } catch (e) {
        return next(e);
      }
    }
    if (queryStr.rosterId) {
      const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      "rosterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
      const params = [queryStr.rosterId];
      try {
        if (!Number(params)) {
          throw new ClientError(400, 'rosterId must be an integer');
        }
        const result = await db.query(sql, params);
        if (result.rows.length === 0) {
          throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`);
        }
        fullResult.push(result.rows);
        return renderAllData(index + 1, fullResult);
      } catch (e) {
        return next(e);
      }
    }
    if (queryStr.orderByRosterId) {
      try {
        if (queryStr.orderByRosterId !== 'true') {
          throw new ClientError(400, 'orderByRosterId must be true');
        }
        const sql = `
        ${sqlQueries.getFightersData(dataTypes[index])}
        ORDER BY
        "rosterId", ${JSON.stringify(dataTypeIds[index])}
        `;
        const result = await db.query(sql);
        fullResult.push(result.rows);
        return renderAllData(index + 1, fullResult);
      } catch (e) {
        return next(e);
      }
    }
    try {
      if (queryKey.length > 0) {
        throw new ClientError(400, `${queryKey} is not a valid query key`);
      }
      const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
    `;
      const result = await db.query(sql);
      fullResult.push(result.rows);
      return renderAllData(index + 1, fullResult);
    } catch (e) {
      return next(e);
    }
  }
});

app.get('/api/fighters/data/:type', async (req: any, res: any, next: any) => {
  const queryStr = req.query;
  const queryKey = Object.keys(queryStr);
  const currentType = req.params.type;
  let index = 0;
  const dataTypes = ['moves', 'throws', 'movements', 'stats'];
  const dataTypeIds = ['moveId', 'throwId', 'movementId', 'statId'];
  try {
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
      const params: any = [queryStr.fighter];
      if (/\d/g.test(params)) {
        throw new ClientError(400, 'fighter name can\'t have a number');
      }
      const result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} named ${params} doesn't exist in the database`);
      }
      return res.status(200).send(result.rows);
    }
  } catch (e) {
    return next(e);
  }
  if (queryStr.fighterId) {
    const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      "fighterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
    const params = [queryStr.fighterId];
    try {
      if (!Number(params)) {
        throw new ClientError(400, 'fighterId must be an integer');
      }
      const result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`);
      }
      return res.status(200).send(result.rows);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.rosterId) {
    const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      WHERE
      "rosterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
    const params = [queryStr.rosterId];
    try {
      if (!Number(params)) {
        throw new ClientError(400, 'rosterId must be an integer');
      }
      const result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`);
      }
      return res.status(200).send(result.rows);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.orderByRosterId) {
    try {
      if (queryStr.orderByRosterId !== 'true') {
        throw new ClientError(400, 'orderByRosterId must be true');
      }
      const sql = `
      ${sqlQueries.getFightersData(dataTypes[index])}
      ORDER BY
      "rosterId", ${JSON.stringify(dataTypeIds[index])}
      `;
      const result = await db.query(sql);
      return res.status(200).send(result.rows);
    } catch (e) {
      return next(e);
    }
  }
  try {
    if (queryKey.length > 0) {
      throw new ClientError(400, `${queryKey} is not a valid query key`);
    }
    const sql = `
    ${sqlQueries.getFightersData(dataTypes[index])}
    ORDER BY ${JSON.stringify(dataTypeIds[index])}
    `;
    const result = await db.query(sql);
    return res.status(200).send(result.rows);
  } catch (e) {
    return next(e);
  }

  function checkValidType() {
    for (let i = 0; i < dataTypes.length; i++) {
      if (currentType === dataTypes[i]) {
        index = i;
        return true;
      }
    }
    return false;
  }
});

app.post('/api/add/fighters', async (req: any, res: any, next: any) => {

  const { fighter, displayName } = req.body;
  let { rosterId } = req.body;
  rosterId = Number(rosterId);
  const reqParams = [fighter, displayName, rosterId];
  const isValid = reqParams.every(param => !!param);
  try {
    if (!isValid) {
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
    const result = await db.query(sql, params);
    if (result.rows.length === 0) {
      throw new ClientError(400, '(fighter), (rosterId), and (displayName) must all be unique');
    } else {
      return res.status(201).json(result.rows[0]);
    }
  } catch (e) {
    return next(e);
  }
});

app.post('/api/add/:table/:id', async (req: any, res: any, next: any) => {
  const fullResult = {};
  const { name, moveType, damage, activeFrames, totalFrames, firstFrame, statValue } = req.body;
  try {
    if (/[A-Z]/gi.test(req.params.id) &&
      req.params.id !== undefined) {
      throw new ClientError(400, 'fighterId must be a number');
    }
    const id = Number(req.params.id);
    let sql = '';
    let sql2 = '';
    let params = [];
    let params2 = [];

    if (req.params.table === 'moves') {
      const reqParams = [name, moveType, damage, activeFrames, totalFrames, firstFrame];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'must have (name), (moveType), (damage), (activeFrames), (totalFrames), and (firstFrame) as parameters');
      }
      sql = `
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
      params = [id, name, moveType];
      sql2 = `
        INSERT INTO public.hitboxes
          ("damage", "activeFrames", "totalFrames", "firstFrame")
        VALUES ($1, $2, $3, $4)
        RETURNING *;
      `;
      params2 = [damage, activeFrames, totalFrames, firstFrame];

    } else if (req.params.table === 'throws') {
      const reqParams = [name, damage, activeFrames, totalFrames];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'must have (name), (damage), (activeFrames), (totalFrames) as parameters');
      }
      sql = `
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
      params = [id, name];
      sql2 = `
          INSERT INTO public.grappling
            ("damage", "activeFrames", "totalFrames")
          VALUES ($1, $2, $3)
          RETURNING *;
        `;
      params2 = [damage, activeFrames, totalFrames];

    } else if (req.params.table === 'movements') {
      const reqParams = [name, activeFrames, totalFrames];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'must have (name), (activeFrames), and (totalFrames) as parameters');
      }
      sql = `
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
      params = [id, name];
      sql2 = `
        INSERT INTO public.dodging
          ("activeFrames", "totalFrames")
        VALUES ($1, $2)
        RETURNING *;
      `;
      params2 = [activeFrames, totalFrames];

    } else if (req.params.table === 'stats') {
      const reqParams = [name, statValue];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'must have (name), and (statValue) as parameters');
      }
      sql = `
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
      params = [id, name];
      sql2 = `
        INSERT INTO public.miscellaneous
          ("statValue")
        VALUES ($1)
        RETURNING *;
        `;
      params2 = [statValue];
    } else {
      throw new ClientError(400, `${req.params.table} is not a valid path parameter`);
    }
    let result = await db.query(sql, params);
    if (result.rows.length === 0) {
      throw new ClientError(404, `fighterId ${id} doesn't exist`);
    }
    Object.assign(fullResult, result.rows[0]);
    result = await db.query(sql2, params2);
    Object.assign(fullResult, result.rows[0]);
    return res.status(201).json(fullResult);
  } catch (e) {
    return next(e);
  }
});

app.put('/api/update/:table/:id', async (req: any, res: any, next: any) => {
  const fullResult = {};
  const { fighter, displayName, name, moveType, damage, activeFrames, totalFrames, firstFrame, statValue } = req.body;
  const { rosterId } = req.body;
  try {
    if (/[A-Z]/gi.test(req.params.id) &&
      req.params.id !== undefined) {
      throw new ClientError(400, 'fighterId must be a number');
    }
    if (/[A-Z]/gi.test(rosterId) &&
    rosterId !== undefined) {
      throw new ClientError(400, 'rosterId must be a number');
    }
    const id = Number(req.params.id);

    if (req.params.table === 'fighters') {
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
      const params = [id, fighter, rosterId, displayName];
      const result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `fighterId ${id} does not exist`);
      }
      return res.status(200).json(result.rows[0]);

    } else if (req.params.table === 'moves') {
      let sql = `
        UPDATE
          public.moves
        SET
          "name" = coalesce($2, "name"),
          "moveType" = coalesce($3, "moveType")
          WHERE
          "moveId"=$1
          RETURNING *;
      `;
      let params = [id, name, moveType];
      let result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `moveId ${id} does not exist`);
      }
      Object.assign(fullResult, result.rows[0]);
      sql = `
        UPDATE
          public.hitboxes
        SET
          "damage" = coalesce($2, "damage"),
          "activeFrames" = coalesce($3, "activeFrames"),
          "totalFrames" = coalesce($4, "totalFrames"),
          "firstFrame" = coalesce($5, "firstFrame")
        WHERE
          "moveId"=$1
        RETURNING *;
      `;
      params = [id, damage, activeFrames, totalFrames, firstFrame];
      result = await db.query(sql, params);
      Object.assign(fullResult, result.rows[0]);
      return res.status(200).json(fullResult);

    } else if (req.params.table === 'throws') {
      let sql = `
        UPDATE
          public.throws
        SET
          "name" = coalesce($2, "name")
        WHERE
          "throwId"=$1
        RETURNING *;
      `;
      let params = [id, name];
      let result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `throwId ${id} does not exist`);
      }
      Object.assign(fullResult, result.rows[0]);
      sql = `
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
      params = [id, damage, activeFrames, totalFrames];
      result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `throwId ${id} does not exist`);
      }
      Object.assign(fullResult, result.rows[0]);
      return res.status(200).json(fullResult);

    } else if (req.params.table === 'movements') {
      let sql = `
        UPDATE
          public.movements
        SET
          "name" = coalesce($2, "name")
        WHERE
          "movementId"=$1
        RETURNING *;
      `;
      let params = [id, name];
      let result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `movementId ${id} does not exist`);
      }
      Object.assign(fullResult, result.rows[0]);
      sql = `
        UPDATE
            public.dodging
        SET
          "activeFrames" = coalesce($2, "activeFrames"),
          "totalFrames" = coalesce($3, "totalFrames")
        WHERE
          "movementId"=$1
        RETURNING *;
      `;
      params = [id, activeFrames, totalFrames];
      result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `movementId ${id} does not exist`);
      }
      Object.assign(fullResult, result.rows[0]);
      return res.status(200).json(fullResult);

    } else if (req.params.table === 'stats') {
      let sql = `
        UPDATE
          public.stats
        SET
          "name" = coalesce($2, "name")
        WHERE
          "statId"=$1
        RETURNING *;
      `;
      let params = [id, name];
      let result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `statId ${id} does not exist`);
      }
      Object.assign(fullResult, result.rows[0]);
      sql = `
        UPDATE
          public.miscellaneous
        SET
          "statValue" = coalesce($2, "statValue")
        WHERE
          "statId"=$1
        RETURNING *;
      `;
      params = [id, statValue];
      result = await db.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `statId ${id} does not exist`);
      }
      Object.assign(fullResult, result.rows[0]);
      return res.status(200).json(fullResult);
    } else {
      throw new ClientError(400, `${req.params.table} is not a valid path parameter`);
    }
  } catch (e) {
    return next(e);
  }
});

app.delete('/api/delete/:table/:id', async (req: any, res: any, next: any) => {

  try {
    if (/[A-Z]/gi.test(req.params.id) &&
      req.params.id !== undefined) {
      throw new ClientError(400, 'id must be a number');
    }
    const id = Number(req.params.id);
    let sql = '';
    const notFoundError = `${req.params.table.slice(0, req.params.table.length - 1)}Id ${id} doesn't exist`;
    const params = [id];

    if (req.params.table === 'fighters') {
      sql = `
        DELETE FROM
          public.fighters
        WHERE
          "fighterId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'moves') {
      sql = `
        DELETE FROM
          public.moves
        WHERE
          "moveId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'throws') {
      sql = `
        DELETE FROM
          public.throws
        WHERE
          "throwId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'movements') {
      sql = `
        DELETE FROM
          public.movements
        WHERE
          "movementId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'stats') {
      sql = `
        DELETE FROM
          public.stats
        WHERE
          "statId"=$1
        RETURNING *;
      `;
    } else {
      throw new ClientError(400, `${req.params.table} is not a valid path parameter`);
    }
    const result = await db.query(sql, params);
    if (result.rowCount === 0) {
      throw new ClientError(404, notFoundError);
    }
    return res.status(204).json(result.rowCount);
  } catch (e) {
    return next(e);
  }
});

app.use(errorMiddleware);

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${process.env.PORT}`);
});
