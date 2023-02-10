import ClientError from '../utils/client-error';
import { client } from '../conn';
import { Req, Res } from '../utils/types-routes';

var express = require('express');
const deleteRoutes = express.Router(); // Base route: 'api/delete'

/**
 * Delete route that removes data from a table and id of your choice
 * @param { string } table // fighters, moves, throws, movements, or stats
 * @param { number } id   // fighterId, moveId, throwId, movementId, or statId
 * @return 204 status code
 */
deleteRoutes.delete('/:table/:id', async (req: Req, res: Res, next: (param1: any) => any) => {

  const authHeader: string = req.headers['authorization'];

  try {
    if (!authHeader) {
      throw new ClientError(400, 'authorization header must have a value');
    } else if (authHeader !== process.env.API_KEY) {
      throw new ClientError(400, 'Incorrect value for authorization header');
    }
    if (/[A-Z]/gi.test(req.params.id) &&
      req.params.id !== undefined) {
      throw new ClientError(400, 'id must be a number');
    }
    const id = Number(req.params.id);
    let sql = '';
    const notFoundError = `${req.params.table.slice(0, req.params.table.length - 1)}Id ${id} doesn't exist`;
    const params = [id];

    if (req.params.table === 'fighters') {
      sql = `
        DELETE FROM
          public.fighters
        WHERE
          "fighterId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'moves') {
      sql = `
        DELETE FROM
          public.moves
        WHERE
          "moveId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'throws') {
      sql = `
        DELETE FROM
          public.throws
        WHERE
          "throwId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'movements') {
      sql = `
        DELETE FROM
          public.movements
        WHERE
          "movementId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'stats') {
      sql = `
        DELETE FROM
          public.stats
        WHERE
          "statId"=$1
        RETURNING *;
      `;
    } else {
      throw new ClientError(400, `${req.params.table} is not a valid path parameter`);
    }
    const result = await client.query(sql, params);
    if (result.rowCount === 0) {
      throw new ClientError(404, notFoundError);
    }
    return res.status(204).json(result.rowCount);
  } catch (e) {
    return next(e);
  }
});

module.exports = deleteRoutes;
