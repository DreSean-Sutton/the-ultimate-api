import { Req, Res } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client } from '../conn';
import { Op } from "sequelize";
import defineUserDb from '../lib/define-user-db';
require('dotenv/config');
const jwt = require('jsonwebtoken');
const { sequelize } = require('../conn');
const { User } = require('../model/user-table');
const { authorizeUser } = require('../lib/authorizeUser');

/**
 * Post route that inserts a new fighter and their basic data to the database
 * Returns inserted data
 * @param { string } fighter
 * @param { string } displayName
 * @param { number } rosterId
 * @return { object }
 */

async function postFighters(req: Req, res: Res, next: any) {
  const { authorization, username } = req.headers;
  const { fighter, displayName } = req.body;
  let { rosterId } = req.body;
  rosterId = Number(rosterId);
  const reqParams = [fighter, displayName, rosterId];
  const isValid = reqParams.every(param => !!param);

  try {
    if(!isValid) throw new ClientError(400, 'Must have (fighter), (displayName), and (rosterId) as parameters');
    const userIsTrue = authorization || username;
    const authResult = userIsTrue ? await authorizeUser(authorization, username, next) : null;
    if (!authResult.userDB) throw new ClientError(authResult.status, authResult.message);

    const { Fighters } = defineUserDb(authResult.userDB);
    const selectResult = await Fighters.findOne({
      where: {
        [Op.or]: [
          { rosterId: rosterId },
          { fighter: fighter },
          { displayName: displayName }
        ]
      }});

    if(selectResult) {
      const { dataValues } = selectResult;
      if(dataValues.fighter === fighter) throw new ClientError(400, `Fighter (${fighter}) must be unique`);
      if(dataValues.rosterId === rosterId) throw new ClientError(400, `RosterId (${rosterId}) must be unique`);
      if(dataValues.displayName === displayName) throw new ClientError(400, `DisplayName (${displayName}) must be unique`);
    }
    const insertResult = await Fighters.create({
      fighter: fighter,
      rosterId: rosterId,
      displayName: displayName
    });
    await insertResult.save();
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
  const { authorization, username } = req.headers;
  const fullResult = {};
  const { name, moveType, damage, category, activeFrames, totalFrames, firstFrame, statValue } = req.body;
  try {
    if (/[A-Z]/gi.test(req.params.id) &&
      req.params.id !== undefined) {
      throw new ClientError(400, 'fighterId must be a number');
    }
    const id = Number(req.params.id);
    const userIsTrue = authorization || username;
    const authResult = userIsTrue ? await authorizeUser(authorization, username, next) : null;
    if (!authResult.userDB) throw new ClientError(authResult.status, authResult.message);

    const { Fighters, Moves, Hitboxes, Throws, Grappling, Movements, Dodging, Stats, Miscellaneous } = defineUserDb(authResult.userDB);
    const selectResult = await Fighters.findOne({
      where: {
        fighterId: id
      }});

      if(!selectResult) {
        throw new ClientError(400, `fighterId ${(id)} doesn't exist`);
      }

    if (req.params.table === 'moves') {
      const reqParams = [name, moveType, damage, category, activeFrames, totalFrames, firstFrame];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'Must have (name), (moveType), (damage), (category), (activeFrames), (totalFrames), and (firstFrame) as parameters');
      }

      const [moves, hitboxes] = await sequelize.transaction(async (t: any) => {

        const moves = await Moves.create({
          category: category,
          fighterId: id,
          moveType: moveType,
          name: name,
          type: 'move'
        }, { transaction: t });

        const hitboxes = await Hitboxes.create({
          activeFrames: activeFrames,
          damage: damage,
          firstFrame: firstFrame,
          totalFrames: totalFrames
        }, { transaction: t });

        return [moves, hitboxes];
      });

      Object.assign(fullResult, moves.dataValues);
      Object.assign(fullResult, hitboxes.dataValues);
      await moves.save();
      await hitboxes.save();
      return res.status(201).json(fullResult);

    } else if (req.params.table === 'throws') {
      const reqParams = [name, damage, activeFrames, totalFrames];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'Must have (name), (damage), (activeFrames), (totalFrames) as parameters');
      }

      const [throws, grappling] = await sequelize.transaction(async (t: any) => {

        const throws = await Throws.create({
          fighterId: id,
          name: name,
          type: 'throw',
        }, { transaction: t });

        const grappling = await Grappling.create({
          activeFrames: activeFrames,
          damage: damage,
          totalFrames: totalFrames
        }, { transaction: t });

        return [throws, grappling];
      });

      Object.assign(fullResult, throws.dataValues);
      Object.assign(fullResult, grappling.dataValues);
      await throws.save();
      await grappling.save();
      return res.status(201).json(fullResult);

    } else if (req.params.table === 'movements') {
      const reqParams = [name, activeFrames, totalFrames];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'Must have (name), (activeFrames), and (totalFrames) as parameters');
      }

      const [movements, dodging] = await sequelize.transaction(async (t: any) => {

        const movements = await Movements.create({
          fighterId: id,
          name: name,
          type: 'movement',
        }, { transaction: t });

        const dodging = await Dodging.create({
          activeFrames: activeFrames,
          totalFrames: totalFrames
        }, { transaction: t });

        return [movements, dodging];
      });

      Object.assign(fullResult, movements.dataValues);
      Object.assign(fullResult, dodging.dataValues);
      await movements.save();
      await dodging.save();
      return res.status(201).json(fullResult);

    } else if (req.params.table === 'stats') {
      const reqParams = [name, statValue];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'Must have (name), and (statValue) as parameters');
      }

      const [stats, miscellaneous] = await sequelize.transaction(async (t: any) => {

        const stats = await Stats.create({
          fighterId: id,
          name: name,
          type: 'stat',
        }, { transaction: t });

        const miscellaneous = await Miscellaneous.create({
          statValue: statValue
        }, { transaction: t });

        return [stats, miscellaneous];
      });

      Object.assign(fullResult, stats.dataValues);
      Object.assign(fullResult, miscellaneous.dataValues);
      await stats.save();
      await miscellaneous.save();
      return res.status(201).json(fullResult);

    } else {
      throw new ClientError(400, `${req.params.table} is not a valid path parameter`);
    }
  } catch (e) {
    return next(e);
  }
}
module.exports = {
  postFighters,
  postTableData
}
