import { Req, Res } from '../utils/types-routes';
import ClientError from '../utils/client-error';
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
    if (authResult) throw new ClientError(authResult.status, authResult.message);

    if (req.params.table === 'fighters') {
      if (/[A-Z]/gi.test(rosterId) &&
      rosterId) {
        throw new ClientError(400, 'rosterId must be a number');
      }

      await sequelize.transaction(async (t: any) => {
        const FightersModel = sequelize.models.fighters;

        const result = await FightersModel.findOne({
          where: { fighterId: id }, transaction: t, schema: username
        });

        if (!result) {
          throw new ClientError(404, `fighterId ${(id)} doesn't exist`);
        }
        const updateResult = await FightersModel.update({
          fighter: fighter, displayName: displayName, rosterId: rosterId
        },
        { where: { fighterId: id }, transaction: t, schema: username });

        if (updateResult[0] === 0) {
          throw new ClientError(400, 'At least one of (fighter), (rosterId), or (displayName) must have a value');
        }
        await sequelize.sync({ schema: username });
        return res.status(200).json({ message: 'Fighter has been updated successfully', affectedFighterId: result.dataValues.fighterId });
      })

    } else if (req.params.table === 'moves') {
      await sequelize.transaction(async (t: any) => {
        const MovesModel = sequelize.models.moves;
        const HitboxesModel = sequelize.models.hitboxes;

        const result = await MovesModel.findOne({
          where: { moveId: id }, transaction: t, schema: username
        });

        if (!result) {
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

        if (moves[0] === 0 && hitboxes[0] === 0) {
          throw new ClientError(400, 'No values were changed');
        }
        await sequelize.sync({ schema: username });
        return res.status(200).json({ message: 'Moves have been updated successfully', affectedFighterId: result.dataValues.fighterId });
      });

    } else if (req.params.table === 'throws') {
      await sequelize.transaction(async (t: any) => {
        const ThrowsModel = sequelize.models.throws;
        const GrapplingModel = sequelize.models.grappling;

        const result = await ThrowsModel.findOne({
          where: { throwId: id }, transaction: t, schema: username
        });
        if (!result) {
          throw new ClientError(404, `(throwId) ${id} doesn't exist`);
        }
        const throws = await ThrowsModel.update({
          name: name
        }, { where: { throwId: id }, transaction: t, schema: username });

        const grappling = await GrapplingModel.update({
          activeFrames: activeFrames, damage: damage, totalFrames
        }, { where: { throwId: id }, transaction: t, schema: username });

        if(throws[0] === 0 && grappling[0] === 0) {
          throw new ClientError(400, 'No values were changed');
        }
        await sequelize.sync({ schema: username });
        return res.status(200).json({ message: 'Throws have been updated successfully', affectedFighterId: result.dataValues.fighterId });
      })

    } else if (req.params.table === 'movements') {
      await sequelize.transaction(async (t: any) => {
        const MovementsModel = sequelize.models.movements;
        const DodgingModel = sequelize.models.dodging;

        const result = await MovementsModel.findOne({
          where: { movementId: id }, transaction: t, schema: username
        });
        if(!result) {
          throw new ClientError(404, `(movementId) ${id} doesn't exist`);
        }

        const movements = await MovementsModel.update({
          name: name
        }, { where: { movementId: id }, transaction: t, schema: username});

        const dodging = await DodgingModel.update({
          activeFrames: activeFrames, totalFrames: totalFrames
        }, { where: { movementId: id }, transaction: t, schema: username });

        if (movements[0] === 0 && dodging[0] === 0) {
          throw new ClientError(400, 'No values were changed');
        }
        await sequelize.sync({ schema: username });
        return res.status(200).json({ message: 'Movements have been updated successfully', affectedFighterId: result.dataValues.fighterId });
      });

    } else if (req.params.table === 'stats') {
      await sequelize.transaction(async (t: any) => {
        const StatsModel = sequelize.models.stats;
        const MiscellaneousModel = sequelize.models.miscellaneous;

        const result = await StatsModel.findOne({
          where: { statId: id }, transaction: t, schema: username
        });

        if (!result) {
          throw new ClientError(404, `(statId) ${id} doesn't exist`);
        }

        const stats = await StatsModel.update({
          name: name
        }, { where: { statId: id }, transaction: t, schema: username });

        const miscellaneous = await MiscellaneousModel.update({
          statValue: statValue
        }, { where: { statId: id }, transaction: t, schema: username });

        if(stats[0] === 0 && miscellaneous[0] === 0) {
          throw new ClientError(400, 'No values were changed');
        }
        await sequelize.sync({ schema: username });
        return res.status(200).json({ message: 'Stats have been updated successfully', affectedFighterId: result.dataValues.fighterId });
      });
    } else {
      throw new ClientError(400, `${req.params.table} is not a valid path parameter`);
    }
  } catch (e: any) {
    if (e.name === 'SequelizeUniqueConstraintError') {
      return next(new ClientError(400, e.errors[0].message));
    }
    return next(e);
  }
}

module.exports = {
  updateTableData,
}
