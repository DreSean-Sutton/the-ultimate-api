import { Req, Res } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client } from '../conn';
require('dotenv/config');
const jwt = require('jsonwebtoken');
const { sequelize } = require('../conn');
const { User } = require('../model/user-table');
const { authorizeUser } = require('../lib/authorizeUser');

/**
 *
 * Put route that updates data at the table and id of your choice
 * Not all params are required
 * returns updated data
 * @param { string } name
 * @param { string } moveType
 * @param { string } damage
 * @param { string } category
 * @param { string } activeFrames
 * @param { string } totalFrames
 * @param { string } firstFrame
 * @param { string } statValue
 * @param { string } table // fighters, moves, throws, movements, or stats
 * @param { number } id   // fighterId, moveId, throwId, movementId, or statId
 * @return { object }
 */
async function updateTableData(req: Req, res: Res, next: any) {
  const { authorization, username } = req.headers;
  const fullResult = {};
  const { fighter, displayName, name, moveType, damage, category, activeFrames, totalFrames, firstFrame, statValue } = req.body;
  const { rosterId } = req.body;

  try {
    if (/[A-Z]/gi.test(req.params.id) &&
      req.params.id !== undefined) {
      throw new ClientError(400, 'fighterId must be a number');
    }
    const id = Number(req.params.id);
    const userIsTrue = authorization || username;
    const authResult = userIsTrue ? await authorizeUser(authorization, username, next) : null;
    if(authResult) throw new ClientError(authResult.status, authResult.message);

    const FightersModel = sequelize.models.fighters;
    const selectResult = await FightersModel.findOne({
      where: {
        fighterId: id
      },
      schema: username});
      // console.log(selectResult);
      if(!selectResult) {
        throw new ClientError(400, `fighterId ${(id)} doesn't exist`);
      }

    if (req.params.table === 'fighters') {
      if (/[A-Z]/gi.test(rosterId)) {
        throw new ClientError(400, 'rosterId must be a number');
      }
      const updateFields: any = { length: 0 };

      if (rosterId !== undefined) {
        updateFields.rosterId = rosterId;
        updateFields.length++;
      }
      if (fighter !== undefined) {
        updateFields.fighter = fighter;
        updateFields.length++;
      }
      if (displayName !== undefined) {
        updateFields.displayName = displayName;
        updateFields.length++;
      }
      if(updateFields.length === 0) {
        throw new ClientError(400, 'At least one of each (fighter), (rosterId), or (displayName) must have a value');
      }
      const updateResult = await FightersModel.update(
        { rosterId: rosterId, fighter: fighter, displayName: displayName }, {
        where: { fighterId: id }
      })
      if(updateResult) {
        return res.status(200).json(updateResult);
      }
      throw new ClientError(404, `fighterId ${id} does not exist`);
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
      let result = await client.query(sql, params);
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
      result = await client.query(sql, params);
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
      let result = await client.query(sql, params);
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
      result = await client.query(sql, params);
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
      let result = await client.query(sql, params);
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
      result = await client.query(sql, params);
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
      let result = await client.query(sql, params);
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
      result = await client.query(sql, params);
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
}

module.exports = {
  updateTableData,
}
