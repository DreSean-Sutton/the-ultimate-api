import { Req, Res } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client } from '../conn';
import { Op } from "sequelize";
require('dotenv/config');
const jwt = require('jsonwebtoken');
const { sequelize } = require('../conn');
const { User } = require('../model/user-database');
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
    if(authResult) throw new ClientError(authResult.status, authResult.message);

    const FightersModel = sequelize.models.fighters;
    const selectResult = await FightersModel.findOne({
      where: {
        [Op.or]: [
          { rosterId: rosterId },
          { fighter: fighter },
          { displayName: displayName }
        ]
      },
      schema: username});

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
    }, { schema: username });
    await sequelize.sync({ schema: username });
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
    if(authResult) throw new ClientError(authResult.status, authResult.message);

    const FightersModel = sequelize.models.fighters;
    const selectResult = await FightersModel.findOne({
      where: {
        fighterId: id
      },
      schema: username});

      if(!selectResult) {
        throw new ClientError(400, `fighterId ${(id)} doesn't exist`);
      }

    if (req.params.table === 'moves') {
      const reqParams = [name, moveType, damage, category, activeFrames, totalFrames, firstFrame];
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
        }, { transaction: t, schema: username });

        const hitboxes = await HitboxesModel.create({
          activeFrames: activeFrames,
          damage: damage,
          firstFrame: firstFrame,
          totalFrames: totalFrames
        }, { transaction: t, schema: username });

        return [moves, hitboxes];
      });

      Object.assign(fullResult, moves.dataValues);
      Object.assign(fullResult, hitboxes.dataValues);
      return res.status(201).json(fullResult);

    } else if (req.params.table === 'throws') {
      const reqParams = [name, damage, activeFrames, totalFrames];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'Must have (name), (damage), (activeFrames), (totalFrames) as parameters');
      }

      const ThrowsModel = sequelize.models.throws;
      const GrapplingModel = sequelize.models.grappling;

      const [throws, grappling] = await sequelize.transaction(async (t: any) => {

        const throws = await ThrowsModel.create({
          fighterId: id,
          name: name,
          type: 'throw',
        }, { transaction: t, schema: username });

        const grappling = await GrapplingModel.create({
          activeFrames: activeFrames,
          damage: damage,
          totalFrames: totalFrames
        }, { transaction: t, schema: username });

        return [throws, grappling];
      });

      Object.assign(fullResult, throws.dataValues);
      Object.assign(fullResult, grappling.dataValues);
      return res.status(201).json(fullResult);

    } else if (req.params.table === 'movements') {
      const reqParams = [name, activeFrames, totalFrames];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'Must have (name), (activeFrames), and (totalFrames) as parameters');
      }

      const MovementsModel = sequelize.models.movements;
      const DodgingModel = sequelize.models.dodging;

      const [movements, dodging] = await sequelize.transaction(async (t: any) => {

        const movements = await MovementsModel.create({
          fighterId: id,
          name: name,
          type: 'movement',
        }, { transaction: t, schema: username });

        const dodging = await DodgingModel.create({
          activeFrames: activeFrames,
          totalFrames: totalFrames
        }, { transaction: t, schema: username });

        return [movements, dodging];
      });

      Object.assign(fullResult, movements.dataValues);
      Object.assign(fullResult, dodging.dataValues);
      return res.status(201).json(fullResult);

    } else if (req.params.table === 'stats') {
      const reqParams = [name, statValue];
      const isValid = reqParams.every(param => !!param);
      if (!isValid) {
        throw new ClientError(400, 'Must have (name), and (statValue) as parameters');
      }

      const StatsModel = sequelize.models.stats;
      const MiscellaneousModel = sequelize.models.miscellaneous;

      const [stats, miscellaneous] = await sequelize.transaction(async (t: any) => {

        const stats = await StatsModel.create({
          fighterId: id,
          name: name,
          type: 'stat',
        }, { transaction: t, schema: username });

        const miscellaneous = await MiscellaneousModel.create({
          statValue: statValue
        }, { transaction: t, schema: username });

        return [stats, miscellaneous];
      });

      Object.assign(fullResult, stats.dataValues);
      Object.assign(fullResult, miscellaneous.dataValues);
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
