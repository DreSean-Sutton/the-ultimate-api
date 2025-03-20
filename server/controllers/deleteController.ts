import { Req, Res } from '../utils/types-routes';
import ClientError from '../utils/client-error';
import { sequelize } from '../conn';
import defineUserDb from '../lib/define-user-db';
const jwt = require('jsonwebtoken');
const { User } = require('../model/user-table');
const { authorizeUser } = require('../lib/authorizeUser');

/**
 * Delete route that removes data from a table and id of your choice
 * @param { string } table // fighters, moves, throws, movements, or stats
 * @param { number } id   // fighterId, moveId, throwId, movementId, or statId
 * @return 204 status code
 */
async function deleteFromTable(req: Req, res: Res, next: any) {

  const { authorization, username } = req.headers;

  try {
    if (/[A-Z]/gi.test(req.params.id) &&
      req.params.id !== undefined) {
      throw new ClientError(400, 'id must be a number');
    }

    const id = Number(req.params.id);
    const userIsTrue = authorization || username;
    const authResult = userIsTrue ? await authorizeUser(authorization, username, next) : null;
    if (!authResult.dataValues) throw new ClientError(authResult.status, authResult.message);
    const notFoundError: string = `${req.params.table.slice(0, req.params.table.length - 1)}Id ${id} doesn't exist`;

    const { Fighters, Moves, Hitboxes, Throws, Grappling, Movements, Dodging, Stats, Miscellaneous } = defineUserDb(authResult.dataValues.userDB);

    if (req.params.table === 'fighters') {

        const fighters = await Fighters.destroy({
          where: { fighterId: id }
        });
        if (fighters !== 1) {
          throw new ClientError(404, notFoundError);
        }
        authResult.rowCount --;
        await authResult.save();
        return res.status(204).json({});
    } else if (req.params.table === 'moves') {

      const moves = await Moves.destroy({
        where: { moveId: id }
      });
      if (moves !== 1) {
        throw new ClientError(404, notFoundError);
      }
      authResult.rowCount -= 2;
      await authResult.save();
      return res.status(204).json({});
    } else if (req.params.table === 'throws') {

      const throws = await Throws.destroy({
        where: { throwId: id }
      });

      if (throws!== 1) {
        throw new ClientError(404, notFoundError);
      }
      authResult.rowCount -= 2;
      await authResult.save();
      return res.status(204).json({});
    } else if (req.params.table === 'movements') {

      const movements = await Movements.destroy({
        where: { movementId: id }
      });

      if (movements!== 1) {
        throw new ClientError(404, notFoundError);
      }
      authResult.rowCount -= 2;
      await authResult.save();
      return res.status(204).json({});
    } else if (req.params.table === 'stats') {

      const stats = await Stats.destroy({
        where: { statId: id }
      });

      if (stats!== 1) {
        throw new ClientError(404, notFoundError);
      }
      authResult.rowCount -= 2;
      await authResult.save();
      return res.status(204).json({});
    } else {
      throw new ClientError(400, `${req.params.table} is not a valid path parameter`);
    }
  } catch (e) {
    return next(e);
  }
}

module.exports = {
  deleteFromTable,
}
