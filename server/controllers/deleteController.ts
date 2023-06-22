import { Req, Res } from '../utils/types-routes';
import ClientError from '../utils/client-error';
import { sequelize } from '../conn';
require('dotenv/config');
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
    if (authResult) throw new ClientError(authResult.status, authResult.message);

    const notFoundError: string = `${req.params.table.slice(0, req.params.table.length - 1)}Id ${id} doesn't exist`;

    if (req.params.table === 'fighters') {

        const fightersModel = sequelize.models.fighters;

        const fighters = await fightersModel.destroy({
          where: { fighterId: id }, schema: username
        });
        if (fighters !== 1) {
          throw new ClientError(404, notFoundError);
        }

        return res.status(204).json({});
    } else if (req.params.table === 'moves') {

      const movesModel = sequelize.models.moves;

      const moves = await movesModel.destroy({
        where: { moveId: id }, schema: username
      });
      if (moves !== 1) {
        throw new ClientError(404, notFoundError);
      }

      return res.status(204).json({});
    } else if (req.params.table === 'throws') {

      const throwsModel = sequelize.models.throws;

      const throws = await throwsModel.destroy({
        where: { throwId: id }, schema: username
      });

      if (throws!== 1) {
        throw new ClientError(404, notFoundError);
      }

      return res.status(204).json({});
    } else if (req.params.table === 'movements') {
      const sql = `
        DELETE FROM
          public.movements
        WHERE
          "movementId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'stats') {
      const sql = `
        DELETE FROM
          public.stats
        WHERE
          "statId"=$1
        RETURNING *;
      `;
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
