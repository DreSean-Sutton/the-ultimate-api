const { sequelize } = require('../conn');
import defineUserDb from './define-user-db';

export default async function handleRestartIds(schemaName: string) {

  const { Fighters, Moves, Throws, Movements, Stats } = await defineUserDb(schemaName);
  const maxFighterId = await Fighters.max('fighterId');
  const maxMoveId = await Moves.max('moveId');
  const maxThrowId = await Throws.max('throwId');
  const maxMovementId = await Movements.max('movementId');
  const maxStatId = await Stats.max('statId');

  await sequelize.query(`ALTER SEQUENCE "${schemaName}"."fighters_fighterId_seq" RESTART WITH ${maxFighterId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schemaName}"."moves_moveId_seq" RESTART WITH ${maxMoveId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schemaName}"."hitboxes_moveId_seq" RESTART WITH ${maxMoveId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schemaName}"."throws_throwId_seq" RESTART WITH ${maxThrowId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schemaName}"."grappling_throwId_seq" RESTART WITH ${maxThrowId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schemaName}"."movements_movementId_seq" RESTART WITH ${maxMovementId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schemaName}"."dodging_movementId_seq" RESTART WITH ${maxMovementId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schemaName}"."stats_statId_seq" RESTART WITH ${maxStatId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schemaName}"."miscellaneous_statId_seq" RESTART WITH ${maxStatId + 1}`);
  await sequelize.sync({ schema: schemaName });
  console.log("All model's id incrementation value has been synced");
}
