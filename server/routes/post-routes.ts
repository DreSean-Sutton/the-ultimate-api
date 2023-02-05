import ClientError from '../utils/client-error';
import { db } from '../conn';
import { Req, Res } from '../utils/types-routes';

var express = require('express');
const postRoutes = express.Router(); // base route: 'api/add'

/**
 * Post route that inserts a new fighter and their basic data to the database
 * Returns inserted data
 * @param { string } fighter
 * @param { string } displayName
 * @param { number } rosterId
 * @return { object }
 */
postRoutes.post('/fighters', async (req: Req, res: Res, next: (param1: any) => any) => {

  const authHeader: string = req.headers['authorization'];
  const { fighter, displayName } = req.body;
  let { rosterId } = req.body;
  rosterId = Number(rosterId);
  const reqParams = [fighter, displayName, rosterId];
  const isValid = reqParams.every(param => !!param);
  try {
    if (!authHeader) {
      throw new ClientError(400, 'authorization header must have a value');
    } else if (authHeader !== process.env.API_KEY) {
      throw new ClientError(400, 'Incorrect value for authorization header');
    }
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

/**
 * Post route that inserts data into a table and fighter of your choice
 * Returns inserted data
 * @param { string } name
 * @param { string } moveType
 * @param { string } damage
 * @param { string } category
 * @param { string } activeFrames
 * @param { string } totalFrames
 * @param { string } firstFrame
 * @param { string } statValue
 * @param { string } table // moves, throws, movements, stats
 * @param { number } id // fighterId
 * @return { object }
 */
postRoutes.post('/:table/:id', async (req: Req, res: Res, next: (param1: any) => any) => {

  const authHeader: string = req.headers['authorization'];
  const fullResult = {};
  const { name, moveType, damage, category, activeFrames, totalFrames, firstFrame, statValue } = req.body;
  try {
    if (!authHeader) {
      throw new ClientError(400, 'authorization header must have a value');
    } else if (authHeader !== process.env.API_KEY) {
      throw new ClientError(400, 'Incorrect value for authorization header');
    }
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
      const reqParams = [name, moveType, damage, category, activeFrames, totalFrames, firstFrame];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'must have (name), (moveType), (damage), (category), (activeFrames), (totalFrames), and (firstFrame) as parameters');
      }
      sql = `
        INSERT INTO public.moves (
          "fighterId", "name", "moveType", "category", "type"
        )
        SELECT $1, $2, $3, $4, 'moves'
        WHERE EXISTS (
            SELECT 1
              FROM "fighters"
            WHERE "fighterId"=$1
        )
        RETURNING *;
      `;
      params = [id, name, moveType, category];
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

module.exports = postRoutes;
