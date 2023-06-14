import { Req, Res } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client, sequelize } from '../conn';
require('dotenv/config');
const jwt = require('jsonwebtoken');
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

    if (req.params.table === 'fighters') {
      if (/[A-Z]/gi.test(rosterId) &&
      rosterId) {
        throw new ClientError(400, 'rosterId must be a number');
      }

      await sequelize.transaction(async (t: any) => {
        const FightersModel = sequelize.models.fighters;
        const selectResult = await FightersModel.findOne({
          where: { fighterId: id }, transaction: t, schema: username });

        if(!selectResult) {
          throw new ClientError(404, `fighterId ${(id)} doesn't exist`);
        }
        const updateResult = await FightersModel.update(
          { fighter: fighter, displayName: displayName, rosterId: rosterId }, {
            where: { fighterId: id }, transaction: t, schema: username });

        if(updateResult[0] === 0) {
          throw new ClientError(400, 'At least one of (fighter), (rosterId), or (displayName) must have a value');
        }
        await sequelize.sync({ schema: username });
        return res.status(200).json(updateResult);
      })

    } else if (req.params.table === 'moves') {
      const MovesModel = sequelize.models.moves;
      const HitboxesModel = sequelize.models.hitboxes;

      await sequelize.transaction(async (t: any) => {

        const result = await MovesModel.findOne({
          where: { moveId: id }
        }, { transaction: t, schema: username });

        if(!result) {
          throw new ClientError(404, `(moveId) ${id} doesn't exist`);
        }
        const moves = await MovesModel.update({
          name: name,
          moveType: moveType,
          category: category
        }, { where: { moveId: id }, transaction: t, schema: username });

        const hitboxes = await HitboxesModel.update({
          activeFrames: activeFrames,
          damage: damage,
          firstFrame: firstFrame,
          totalFrames: totalFrames
        }, { where: { moveId: id }, transaction: t, schema: username });

        if(moves[0] === 0 && hitboxes[0] === 0) {
          throw new ClientError(400, 'No values were changed');
        }
        await sequelize.sync({ schema: username });
        return res.status(200).json({ message: 'Moves have been updated successfully', affectedFighterId: result.dataValues.fighterId });
      });

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
  } catch (e: any) {
    // console.error(e);
    if(e.name === 'SequelizeUniqueConstraintError') {
      return next(new ClientError(400, e.errors[0].message));
    }
    return next(e);
  }
}

module.exports = {
  updateTableData,
}
