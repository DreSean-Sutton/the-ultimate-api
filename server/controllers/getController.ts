import { Req, Res, QueryString } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client } from '../conn';
const sqlQueries = require('../utils/sql-queries');
const { authorizeUser } = require('../lib/authorizeUser');

/**
 * All routes accept query strings for specifying a single fighter
 * Can specify `fighter` name, `fighterId`, and `rosterId`
 * Can use query string to set orderByRosterId to true to change order from fighterId to rosterId
 * @param { string } fighter // query string
 * @param { number } fighterId // query string
 * @param { number } rosterId // query string
 * @param { boolean } orderByRosterId // query string
 */



/**
 * Get controller that returns all fighters and their basic fighter data
 * Can use query strings to return a single fighter object
 * @return { object | [object] }
 */
async function getFighters(req: Req, res: Res, next: any) {
  const { authorization, username } = req.headers;
  const userIsTrue = authorization && username;
  const schemaName = userIsTrue ? username : 'public';

  if(userIsTrue) {
    authorizeUser(authorization, username, next);
  }
  const queryStr: QueryString = req.query;
  const queryKey = Object.keys(queryStr);

  if (queryStr.fighter) {
    const sql = `
    ${sqlQueries.getFighters(schemaName)}
    WHERE
      fighter=$1
    `;
    const params: string[] = [queryStr.fighter];
    try {
      if (/\d/g.test(params[0])) {
        throw new ClientError(400, 'fighter name can\'t have a number');
      }
      const result = await client.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} named ${params} doesn't exist in the database`);
      }
      return res.status(200).send(result.rows[0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.fighterId) {
    try {
      if (!Number(queryStr.fighterId) ||
        (Number(queryStr.fighterId) > 2147483647)) {
        throw new ClientError(400, 'fighterId must be an integer');
      }
      const sql = `
      ${sqlQueries.getFighters(schemaName)}
      WHERE
        "fighterId"=$1
      `;
      const params = [queryStr.fighterId];
      const result = await client.query(sql, params);
      if (result.rows.length === 0) {
        throw new ClientError(404, `${queryKey} ${params} doesn't exist in the database`);
      }
      return res.status(200).send(result.rows[0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.rosterId) {
    try {
      if (!Number(queryStr.rosterId) ||
        (Number(queryStr.rosterId) > 2147483647)) {
        throw new ClientError(400, 'rosterId must be an integer');
      }
      const sql = `
      ${sqlQueries.getFighters(schemaName)}
      WHERE
        "rosterId"=$1
      `;
      const params = [queryStr.rosterId];
      const result = await client.query(sql, params);
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
      ${sqlQueries.getFighters(schemaName)}
      ORDER BY
      "rosterId"
      `;
      const result = await client.query(sql);
      return res.status(200).send(result.rows);
    } catch (e) {
      return next(e);
    }
  }
  try {
    if (queryKey.length > 0) {
      throw new ClientError(400, `${queryKey} is not a valid query key`);
    }
    const sql = `${sqlQueries.getFighters(schemaName)}`;
    const result = await client.query(sql);
    return res.status(200).send(result.rows);
  } catch (e) {
    return next(e);
  }
}

/**
 * Get route that returns an array of objects with all fighters and all their non-basic data
 * Can use query strings to return a single fighter object
 * @return { object | [object] }
 */
async function getFightersData(req: Req, res: Res, next: any) {
  const fullResult: any[] = [];
  return renderAllData(0);

  async function renderAllData(index: number): Promise<any[]> {

    const { authorization, username } = req.headers;
    const userIsTrue = authorization && username;
    const schemaName = userIsTrue ? username : 'public';
    if(userIsTrue) {
      authorizeUser(authorization, username, next);
    }
    const dataTypes = ['moves', 'throws', 'movements', 'stats'];
    const dataTypeIds = ['moveId', 'throwId', 'movementId', 'statId'];

    if (dataTypes.length === index) {
      return res.status(200).send(fullResult.flat(1));
    }
    const queryStr: QueryString = req.query;
    const queryKey = Object.keys(queryStr);

    if (queryStr.fighter) {
      const sql = `
      ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
      WHERE
      fighter=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
      const params: any = [queryStr.fighter];

      try {
        if (/\d/g.test(params)) {
          throw new ClientError(400, 'fighter name can\'t have a number');
        }
        const result: any = await client.query(sql, params);
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
      ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
      WHERE
      "fighterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
      const params = [queryStr.fighterId];
      try {
        if (!Number(params)) {
          throw new ClientError(400, 'fighterId must be an integer');
        }
        const result = await client.query(sql, params);
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
      ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
      WHERE
      "rosterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
      const params = [queryStr.rosterId];
      try {
        if (!Number(params)) {
          throw new ClientError(400, 'rosterId must be an integer');
        }
        const result = await client.query(sql, params);
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
        ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
        ORDER BY
        "rosterId", ${JSON.stringify(dataTypeIds[index])}
        `;
        const result = await client.query(sql);
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
      ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
    `;
      const result = await client.query(sql);
      fullResult.push(result.rows);
      return renderAllData(index + 1);
    } catch (e) {
      return next(e);
    }
  }
}

/**
 * Get route that returns an array of objects with all fighters
 * Also accepts query params for specifying the type of data you want
 * @param { string } type // moves, throws, movements, stats
 * @return { [object] }
 */
async function getFightersDataByType(req: Req, res: Res, next: any) {

  const { authorization, username } = req.headers;
  const userIsTrue = authorization && username;
  const schemaName = userIsTrue ? username : 'public';
  if(userIsTrue) {
    authorizeUser(authorization, username, next);
  }
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
      ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
      WHERE
      fighter=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
      const params: any = [queryStr.fighter];
      if (/\d/g.test(params)) {
        throw new ClientError(400, 'fighter name can\'t have a number');
      }
      const result = await client.query(sql, params);
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
      ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
      WHERE
      "fighterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
    const params = [queryStr.fighterId];
    try {
      if (!Number(params)) {
        throw new ClientError(400, 'fighterId must be an integer');
      }
      const result = await client.query(sql, params);
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
      ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
      WHERE
      "rosterId"=$1
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `;
    const params = [queryStr.rosterId];
    try {
      if (!Number(params)) {
        throw new ClientError(400, 'rosterId must be an integer');
      }
      const result = await client.query(sql, params);
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
      ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
      ORDER BY
      "rosterId", ${JSON.stringify(dataTypeIds[index])}
      `;
      const result = await client.query(sql);
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
    ${sqlQueries.getFightersData(dataTypes[index], schemaName)}
    ORDER BY ${JSON.stringify(dataTypeIds[index])}
    `;
    const result = await client.query(sql);
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
}

module.exports = {
  getFighters,
  getFightersData,
  getFightersDataByType
}
