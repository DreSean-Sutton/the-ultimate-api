import ClientError from '../client-error';
import { db } from '../conn';
import { Req, Res } from '../utils/types-routes';

var express = require('express');
const updateRoutes = express.Router();

updateRoutes.put('/:table/:id', async (req: Req, res: Res, next: (param1: any) => any) => {
  const fullResult = {};
  const { fighter, displayName, name, moveType, damage, category, activeFrames, totalFrames, firstFrame, statValue } = req.body;
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
          "moveType" = coalesce($3, "moveType"),
          "category" = coalesce($4, "category")
          WHERE
          "moveId"=$1
          RETURNING *;
      `;
      let params = [id, name, moveType, category];
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

module.exports = updateRoutes;
