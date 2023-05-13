const { sequelize } = require('../conn');

export default async function handleRestartIds(schema: string) {
  const userFightersModel = sequelize.model('fighters', null, { schema: schema });
  const userMovesModel = sequelize.model('moves', null, { schema: schema });
  const userThrowsModel = sequelize.model('throws', null, { schema: schema });
  const userMovementsModel = sequelize.model('movements', null, { schema: schema });
  const userStatsModel = sequelize.model('stats', null, { schema: schema });

  const maxFighterId = await userFightersModel.max('fighterId');
  const maxMoveId = await userMovesModel.max('moveId');
  const maxThrowId = await userThrowsModel.max('throwId');
  const maxMovementId = await userMovementsModel.max('movementId');
  const maxStatId = await userStatsModel.max('statId');

  await sequelize.query(`ALTER SEQUENCE "${schema}"."fighters_fighterId_seq" RESTART WITH ${maxFighterId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."moves_moveId_seq" RESTART WITH ${maxMoveId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."hitboxes_moveId_seq" RESTART WITH ${maxMoveId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."throws_throwId_seq" RESTART WITH ${maxThrowId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."grappling_throwId_seq" RESTART WITH ${maxThrowId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."movements_movementId_seq" RESTART WITH ${maxMovementId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."dodging_movementId_seq" RESTART WITH ${maxMovementId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."stats_statId_seq" RESTART WITH ${maxStatId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."miscellaneous_statId_seq" RESTART WITH ${maxStatId + 1}`);
  console.log("All model's id incrementation value has been synced");
}
