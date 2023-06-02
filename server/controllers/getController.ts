import { Req, Res, QueryString } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client } from '../conn';
const sqlQueries = require('../utils/sql-queries');
const { sequelize } = require('../conn');
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
  const userIsTrue = authorization || username;
  try {
    const authResult = userIsTrue ? await authorizeUser(authorization, username, next) : null;
    if (authResult) throw new ClientError(authResult.status, authResult.message);
  } catch(e) {
    console.error(e);
    return next(e);
  }
  const schemaName = userIsTrue ? username : 'public';
  const queryStr: QueryString = req.query;
  const queryKey = Object.keys(queryStr);

  if (queryStr.fighter) {
    const { fighter } = queryStr;
    try {
      if (/\d/g.test(fighter)) {
        throw new ClientError(400, 'fighter name can\'t have a number');
      }
      const result = await sequelize.query(`
        ${sqlQueries.getFighters(schemaName)}
        WHERE
          "fighter"='${fighter}'
      `);
      if (result[1].rowCount === 0) {
        throw new ClientError(404, `${queryKey} named (${fighter}) doesn't exist in the database`);
      }
      return res.status(200).send(result[0][0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.fighterId) {
    try {
      const { fighterId } = queryStr;
      if (!Number(fighterId) ||
        (Number(fighterId) > 2147483647)) {
        throw new ClientError(400, 'fighterId must be an integer');
      }
      const result = await sequelize.query(`
        ${sqlQueries.getFighters(schemaName)}
        WHERE
          "fighterId"='${fighterId}'
      `);
      if (result[1].rowCount === 0) {
        throw new ClientError(404, `${queryKey} named (${fighterId}) doesn't exist in the database`);
      }
      return res.status(200).send(result[0][0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.rosterId) {
    try {
      const { rosterId } = queryStr;
      if (!Number(rosterId) ||
        (Number(rosterId) > 2147483647)) {
        throw new ClientError(400, 'rosterId must be an integer');
      }
      const result = await sequelize.query(`
        ${sqlQueries.getFighters(schemaName)}
        WHERE
          "rosterId"='${rosterId}'
      `);
      if (result[1].rowCount === 0) {
        throw new ClientError(404, `${queryKey} named (${rosterId}) doesn't exist in the database`);
      }
      return res.status(200).send(result[0][0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.orderByRosterId) {
    try {
      const { orderByRosterId } = queryStr;
      if (orderByRosterId !== 'true') {
        throw new ClientError(400, 'orderByRosterId must be true');
      }
      const result = await sequelize.query(`
        ${sqlQueries.getFighters(schemaName)}
        ORDER BY
          "rosterId"
      `);
      return res.status(200).send(result[0]);
    } catch (e) {
      return next(e);
    }
  }
  try {
    if (queryKey.length > 0) {
      throw new ClientError(400, `${queryKey} is not a valid query key`);
    }
    const result = await sequelize.query(`${sqlQueries.getFighters(schemaName)}`);
    return res.status(200).send(result[0]);
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
  const queryStr: QueryString = req.query;
  const { fighter, fighterId, rosterId, orderByRosterId } = queryStr;
  const queryKey: string = Object.keys(queryStr)[0];
  const { authorization, username } = req.headers;
  const userIsTrue = authorization || username;

  let currentQueryStr;
  if (fighter) {
    currentQueryStr = fighter;
  } else if (fighterId) {
    currentQueryStr = fighterId;
  } else if (rosterId) {
    currentQueryStr = rosterId;
  }

  try {
    const authResult = userIsTrue ? await authorizeUser(authorization, username, next) : null;
    if (authResult) throw new ClientError(authResult.status, authResult.message);
    const schemaName = userIsTrue ? username : 'public';
    const queryTypes = ['fighter', 'fighterId', 'rosterId', 'orderByRosterId'];
    const dataTypes = ['moves', 'throws', 'movements', 'stats'];
    const dataTypeIds = ['moveId', 'throwId', 'movementId', 'statId'];
    const isValidQuery = queryTypes.some(e => e === queryKey);

    if (fighter && /\d/g.test(fighter)) {
      throw new ClientError(400, 'fighter name can\'t have a number');
    } else if (fighterId && !Number(fighterId)) {
      throw new ClientError(400, 'fighterId must be an integer');
    } else if (rosterId && !Number(rosterId)) {
      throw new ClientError(400, 'rosterId must be an integer');
    } else if (orderByRosterId && orderByRosterId !== 'true') {
      throw new ClientError(400, 'orderByRosterId query string can only be true');
    }
    if (queryKey && !isValidQuery) {
      throw new ClientError(400, `${queryKey} is not a valid query string`)
    }
    if (Object.keys(queryStr).length > 1) {
      throw new ClientError(400, 'Only one query string is allowed');
    }
    const FightersModel = sequelize.models.fighters;
    let fightersResult;
    const whereCondition: any = {};
    whereCondition[queryKey] = currentQueryStr;
    if (!queryKey || orderByRosterId) {
      fightersResult = await FightersModel.findOne({});
    } else {
      fightersResult = await FightersModel.findOne({ where: whereCondition });
    }
    if (!fightersResult) {
      throw new ClientError(404, `(${queryKey}) named (${currentQueryStr}) doesn't exist in the database`);
    }
    const currentFighterId = fightersResult.dataValues.fighterId;

    for (let i = 0; i < dataTypes.length; i++) {
      let result;
      if (!queryKey) {
        result = await sequelize.query(`
          ${sqlQueries.getFightersData(dataTypes[i], schemaName, currentFighterId)}
          ORDER BY
            "${dataTypeIds[i]}"
        `);
      } else if (orderByRosterId) {
        result = await sequelize.query(`
          ${sqlQueries.getFightersData(dataTypes[i], schemaName, currentFighterId)}
          ORDER BY
            "rosterId", "${dataTypeIds[i]}"
        `);
      } else {
        result = await sequelize.query(`
          ${sqlQueries.getFightersData(dataTypes[i], schemaName, currentFighterId)}
          WHERE
            "fighterId"=${currentFighterId}
          ORDER BY
            "${dataTypeIds[i]}"
        `);
      }
      if (result[1].rowCount !== 0) {
        fullResult.push(result[0]);
      }
    }
    if (fullResult.length === 0) {
      throw new ClientError(404, `(${queryKey}) named (${currentQueryStr}) doesn't have any data`);
    }
    return res.status(200).send(fullResult.flat(1));
  } catch (e) {
    console.error(e);
    return next(e);
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
  if (userIsTrue) {
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
      const { fighter } = queryStr;
      if (/\d/g.test(fighter)) {
        throw new ClientError(400, 'fighter name can\'t have a number');
      }
      const result = await sequelize.query(`
        ${sqlQueries.getFightersData(currentType, schemaName)}
        WHERE
          "fighter"='${fighter}'
        ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `);
      if (result[1].rowCount === 0) {
        throw new ClientError(404, `${queryKey} named ${fighter} doesn't exist in the database`);
      }
      return res.status(200).send(result[0]);
    }
  } catch (e) {
    return next(e);
  }
  if (queryStr.fighterId) {
    const { fighterId } = queryStr;
    try {
      if (!Number(fighterId)) {
        throw new ClientError(400, 'fighterId must be an integer');
      }
      const result = await sequelize.query(`
        ${sqlQueries.getFightersData(currentType, schemaName)}
        WHERE
          "fighterId"=${fighterId}
        ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `);
      if (result[1].rowCount === 0) {
        throw new ClientError(404, `${queryKey} named ${fighterId} doesn't exist in the database`);
      }
      return res.status(200).send(result[0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.rosterId) {
    const { rosterId } = queryStr;
    try {
      if (!Number(rosterId)) {
        throw new ClientError(400, 'rosterId must be an integer');
      }
      const result = await sequelize.query(`
        ${sqlQueries.getFightersData(currentType, schemaName)}
        WHERE
          "rosterId"=${rosterId}
        ORDER BY ${JSON.stringify(dataTypeIds[index])}
      `);
      if (result[1].rowCount === 0) {
        throw new ClientError(404, `${queryKey} ${rosterId} doesn't exist in the database`);
      }
      return res.status(200).send(result[0]);
    } catch (e) {
      return next(e);
    }
  }
  if (queryStr.orderByRosterId) {
    const { orderByRosterId } = queryStr;
    try {
      if (orderByRosterId !== 'true') {
        throw new ClientError(400, 'orderByRosterId must be true');
      }
      const result = await sequelize.query(`
        ${sqlQueries.getFightersData(currentType, schemaName)}
        ORDER BY
          "rosterId", ${JSON.stringify(dataTypeIds[index])}
      `);
      return res.status(200).send(result[0]);
    } catch (e) {
      return next(e);
    }
  }
  try {
    if (queryKey.length > 0) {
      throw new ClientError(400, `${queryKey} is not a valid query key`);
    }
    const result = await sequelize.query(`
      ${sqlQueries.getFightersData(currentType, schemaName)}
      ORDER BY ${JSON.stringify(dataTypeIds[index])}
    `)
    return res.status(200).send(result[0]);
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
