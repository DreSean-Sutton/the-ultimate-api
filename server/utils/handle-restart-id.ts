const { sequelize } = require('../conn');

export default async function handleRestartIds(schema: string) {
  const userFightersModel = sequelize.model('fighters', null, { schema: schema });
  const usermovesModel = sequelize.model('moves', null, { schema: schema });

  const maxFighterId = await userFightersModel.max('fighterId');
  const maxMoveId = await usermovesModel.max('moveId');

  await sequelize.query(`ALTER SEQUENCE "${schema}"."fighters_fighterId_seq" RESTART WITH ${maxFighterId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."moves_moveId_seq" RESTART WITH ${maxMoveId + 1}`);
  await sequelize.query(`ALTER SEQUENCE "${schema}"."hitboxes_moveId_seq" RESTART WITH ${maxMoveId + 1}`);
  console.log("All model's id incrementation value has been synced");
}
