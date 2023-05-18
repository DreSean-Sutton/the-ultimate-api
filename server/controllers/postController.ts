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

    const FightersModel = sequelize.models.fighters;
    const selectResult = await FightersModel.findOne({
      where: {
        fighterId: id
      },
      schema: usernameHeader});

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
        }, { transaction: t, schema: usernameHeader });

        const hitboxes = await HitboxesModel.create({
          activeFrames: activeFrames,
          damage: damage,
          firstFrame: firstFrame,
          totalFrames: totalFrames
        }, { transaction: t, schema: usernameHeader });

        return [moves, hitboxes];
      });

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

      const ThrowsModel = sequelize.models.throws;
      const GrapplingModel = sequelize.models.grappling;

      const [throws, grappling] = await sequelize.transaction(async (t: any) => {

        const throws = await ThrowsModel.create({
          fighterId: id,
          name: name,
          type: 'throw',
        }, { transaction: t, schema: usernameHeader });

        const grappling = await GrapplingModel.create({
          activeFrames: activeFrames,
          damage: damage,
          totalFrames: totalFrames
        }, { transaction: t, schema: usernameHeader });

        return [throws, grappling];
      });

      Object.assign(fullResult, throws.dataValues);
      Object.assign(fullResult, grappling.dataValues);
      console.log('fullResult value: ', fullResult);
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
        }, { transaction: t, schema: usernameHeader });

        const dodging = await DodgingModel.create({
          activeFrames: activeFrames,
          totalFrames: totalFrames
        }, { transaction: t, schema: usernameHeader });

        return [movements, dodging];
      });

      Object.assign(fullResult, movements.dataValues);
      Object.assign(fullResult, dodging.dataValues);
      console.log('fullResult value: ', fullResult);
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
        }, { transaction: t, schema: usernameHeader });

        const miscellaneous = await MiscellaneousModel.create({
          statValue: statValue
        }, { transaction: t, schema: usernameHeader });

        return [stats, miscellaneous];
      });

      Object.assign(fullResult, stats.dataValues);
      Object.assign(fullResult, miscellaneous.dataValues);
      console.log('fullResult value: ', fullResult);
      return res.status(201).json(fullResult);

    } else {
      throw new ClientError(400, `${req.params.table} is not a valid path parameter`);
    }
    // if (result.rows.length === 0) {
    //   throw new ClientError(404, `fighterId ${id} doesn't exist`);
    // }
  } catch (e) {
    return next(e);
  }
}
module.exports = {
  postFighters,
  postTableData
}
