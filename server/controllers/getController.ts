import { Req, Res, QueryString } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client } from '../conn';
const { fighters } = require('../model/user-database');
const sqlQueries = require('../utils/sql-queries');

async function getFighters(req: Req, res: Res, next: any) {
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
      ${sqlQueries.getFighters()}
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
      ${sqlQueries.getFighters()}
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
      ${sqlQueries.getFighters()}
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
    const sql = `${sqlQueries.getFighters()}`;
    const result = await client.query(sql);
    return res.status(200).send(result.rows);
  } catch (e) {
    return next(e);
  }
}

module.exports = {
  getFighters,
}
