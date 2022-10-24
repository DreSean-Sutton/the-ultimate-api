/**
 * All routes accept query strings for specifying a single fighter
 * Can specify `fighter` name, `fighterId`, and `rosterId`
 * Can use query string to set orderByRosterId to true to change order from fighterId to rosterId
 * @param { string } fighter // query string
 * @param { number } fighterId // query string
 * @param { number } rosterId // query string
 * @param { boolean } orderByRosterId // query string
 */

import ClientError from '../utils/client-error';
import { db } from '../conn';
import { Req, Res, QueryString } from '../utils/types-routes';

var express = require('express');
const sqlQueries = require('../utils/sql-queries');
const getRoutes = express.Router();


/**
 * Get Route that returns all fighters and their basic fighter data
 * Can use query strings to return a single fighter object
 * @return { object | [object] }
 */
getRoutes.get('/', async (req: Req, res: Res, next: (param1: any) => any) => {
  const queryStr: QueryString = req.query;
  const queryKey = Object.keys(queryStr);
  if (queryStr.fighter) {
    const sql = `
    ${sqlQueries.getFighters()}
    WHERE
      fighter=$1
    `;
    const params: string[] = [queryStr.fighter];
    try {
      if (/\d/g.test(params[0])) {
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

/**
 * Get route that returns an array of objects with all fighters and all their non-basic data
 * Can use query strings to return a single fighter object
 * @return { object | [object] }
 */
getRoutes.get('/data', async (req: Req, res: Res, next: (param1: any) => any) => {
  const fullResult: any[] = [];
  return renderAllData(0);

  async function renderAllData(index: number): Promise<any[]> {
    const dataTypes = ['moves', 'throws', 'movements', 'stats'];
    const dataTypeIds = ['moveId', 'throwId', 'movementId', 'statId'];
    if (dataTypes.length === index) {
      return res.status(200).send(fullResult.flat(1));
    }
    const queryStr: QueryString = req.query;
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
        return renderAllData(index + 1);
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
        return renderAllData(index + 1);
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
        return renderAllData(index + 1);
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
        return renderAllData(index + 1);
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
      return renderAllData(index + 1);
    } catch (e) {
      return next(e);
    }
  }
});

/**
 * Get route that returns an array of objects with all fighters
 * Also accepts query params for specifying the type of data you want
 * @param { string } type // moves, throws, movements, stats
 * @return { [object] }
 */
getRoutes.get('/data/:type', async (req: Req, res: Res, next: (param1: any) => any) => {
  const queryStr: QueryString = req.query;
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

  function checkValidType(): boolean {
    for (let i = 0; i < dataTypes.length; i++) {
      if (currentType === dataTypes[i]) {
        index = i;
        return true;
      }
    }
    return false;
  }
});

module.exports = getRoutes;
