import { Req, Res } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client } from '../conn';
import { Op } from "sequelize";
require('dotenv/config');
const jwt = require('jsonwebtoken');
const { sequelize } = require('../conn');
const { User } = require('../model/user-database');

/**
 * Post route that inserts a new fighter and their basic data to the database
 * Returns inserted data
 * @param { string } fighter
 * @param { string } displayName
 * @param { number } rosterId
 * @return { object }
 */

async function postFighters(req: Req, res: Res, next: any) {
  const authHeader: string = req.headers['authorization'];
  const usernameHeader: string = req.headers['username'];
  const { fighter, displayName } = req.body;
  let { rosterId } = req.body;
  rosterId = Number(rosterId);
  const reqParams = [fighter, displayName, rosterId];
  const isValid = reqParams.every(param => !!param);

  try {
    if(!authHeader) throw new ClientError(400, '(authorization) header must have a value');
    if(!usernameHeader) throw new ClientError(400, '(username) header must have a value');
    if(!isValid) throw new ClientError(400, 'Must have (fighter), (displayName), and (rosterId) as parameters');

    const userFindResult = await User.findOne({
      where: {
        username: usernameHeader
      }
    })
    if(!userFindResult) throw new ClientError(401, `Username (${usernameHeader}) doesn't exist`);
    const currentTime = new Date();
    if(currentTime > userFindResult.tokenExpiration) throw new ClientError(401, 'Token has expired. Please log in to receive another');
    const token = authHeader && authHeader.split(' ')[1]; // Checks if authHeader is truthy, then splits 'Bearer' from it's value

    // Token will not be verified if the username is 'test_username' while in a non-production env
    // Used specifically for testing purposes
    if(usernameHeader !== 'test_username' && process.env.NODE_ENV !== 'production') {
      if (token !== userFindResult.token) throw new ClientError(401, 'Invalid authorization token');
    }
    jwt.verify(token, process.env.TOKEN_SECRET, (err: any) => {
      if(err) throw new ClientError(401, 'incorrect authorization header');
    });

    const FightersModel = sequelize.models.fighters;
    const selectResult = await FightersModel.findOne({
      where: {
        [Op.or]: [
          { rosterId: rosterId },
          { fighter: fighter },
          { displayName: displayName }
        ]
      },
      schema: usernameHeader});

    if(selectResult) {
      const { dataValues } = selectResult;
      if(dataValues.fighter === fighter) throw new ClientError(400, `Fighter (${fighter}) must be unique`);
      if(dataValues.rosterId === rosterId) throw new ClientError(400, `RosterId (${rosterId}) must be unique`);
      if(dataValues.displayName === displayName) throw new ClientError(400, `DisplayName (${displayName}) must be unique`);
    }
    const insertResult = await FightersModel.create({
      fighter: fighter,
      rosterId: rosterId,
      displayName: displayName
    }, { schema: usernameHeader });
    await sequelize.sync({ schema: usernameHeader });
    return res.status(201).json(insertResult);
  } catch (e) {
    return next(e);
  }
}

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
async function postTableData(req: Req, res: Res, next: any) {
  const authHeader: string = req.headers['authorization'];
  const usernameHeader: string = req.headers['username'];
  const fullResult = {};
  console.log(req.body);
  const { name, moveType, damage, category, activeFrames, totalFrames, firstFrame, statValue } = req.body;
  try {
    if (!authHeader) throw new ClientError(400, 'authorization header must have a value');
    if (!usernameHeader) throw new ClientError(400, '(username) header must have a value');
    if (/[A-Z]/gi.test(req.params.id) &&
      req.params.id !== undefined) {
      throw new ClientError(400, 'fighterId must be a number');
    }
    const id = Number(req.params.id);
    const userFindResult = await User.findOne({
      where: {
        username: usernameHeader
      }
    })
    if (!userFindResult) throw new ClientError(401, `Username (${usernameHeader}) doesn't exist`);
    const currentTime = new Date();
    if (currentTime > userFindResult.tokenExpiration) throw new ClientError(401, 'Token has expired. Please log in to receive another');
    const token = authHeader && authHeader.split(' ')[1]; // Checks if authHeader is truthy, then splits 'Bearer' from it's value

    // Token will not be verified if the username is 'test_username' while in a non-production env
    // Used specifically for testing purposes
    if (usernameHeader !== 'test_username' && process.env.NODE_ENV !== 'production') {
      if (token !== userFindResult.token) throw new ClientError(401, 'Invalid authorization token');
    }
    jwt.verify(token, process.env.TOKEN_SECRET, (err: any) => {
      if (err) throw new ClientError(401, 'incorrect authorization header');
    });

    let sql = '';
    let sql2 = '';
    let params;
    let params2;

    if (req.params.table === 'moves') {
      const reqParams = [name, moveType, damage, category, activeFrames, totalFrames, firstFrame];
      console.log(reqParams);
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'Must have (name), (moveType), (damage), (category), (activeFrames), (totalFrames), and (firstFrame) as parameters');
      }
      const MovesModel = sequelize.models.moves;
      const HitboxesModel = sequelize.models.hitboxes;

      const [moves, hitboxes] = await sequelize.transaction(async (t: any) => {

        const moves = await MovesModel.create({
          category: category,
          fighterId: id,
          moveType: moveType,
          name: name,
          type: 'move'
        }, { transaction: t, schema: usernameHeader });

        const hitboxes = await HitboxesModel.create({
          activeFrames: activeFrames,
          damage: damage,
          firstFrame: firstFrame,
          totalFrames: totalFrames
        }, { transaction: t, schema: usernameHeader });

        return [moves, hitboxes];
      });

      console.log('moves value: ', moves);
      console.log('hitboxes value: ', hitboxes);
      Object.assign(fullResult, moves.dataValues);
      Object.assign(fullResult, hitboxes.dataValues);
      console.log('fullResult value: ', fullResult);
      return res.status(201).json(fullResult);

    } else if (req.params.table === 'throws') {
      const reqParams = [name, damage, activeFrames, totalFrames];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'Must have (name), (damage), (activeFrames), (totalFrames) as parameters');
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
        throw new ClientError(400, 'Must have (name), (activeFrames), and (totalFrames) as parameters');
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
        throw new ClientError(400, 'Must have (name), and (statValue) as parameters');
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
    let result = await client.query(sql, params);
    if (result.rows.length === 0) {
      throw new ClientError(404, `fighterId ${id} doesn't exist`);
    }
    Object.assign(fullResult, result.rows[0]);
    result = await client.query(sql2, params2);
    Object.assign(fullResult, result.rows[0]);
    return res.status(201).json(fullResult);
  } catch (e) {
    return next(e);
  }
}
module.exports = {
  postFighters,
  postTableData
}
