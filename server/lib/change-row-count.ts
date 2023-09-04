import defineUserDb = require('./define-user-db');
const { sequelize } = require('../conn');
const { User } = require('../model/user-table');

export default async function changeRowCount(schemaName: string, changeAmount: number): Promise<void> {

  const user = await User.findOne({ where: { userDB: schemaName } });
  user.rowCount += changeAmount;
  await user.save();
}
