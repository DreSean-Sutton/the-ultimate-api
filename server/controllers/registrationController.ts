import { Req, Res } from '../utils/types-routes';
import ClientError from '../utils/client-error';
const { User, Fighters } = require('../model/user-database');
const { sequelize } = require('../model/user-database');

async function createUser(req: Req, res: Res, next: any) {

  const { email, username, password } = req.body;
  if (!email || !email.includes('@') || !username || !password) {
    return res.status(400).json({ error: 'Must be a valid email, username, and password' });
  }
  try {
    await sequelize.query('CREATE SCHEMA IF NOT EXISTS "user"');
    console.log('User schema created');
    await User.sync({ force: false });
    console.log('User table created');
    const user = await User.create({
      email: email,
      username: username,
      password: password
    })
    await sequelize.query(`CREATE SCHEMA IF NOT EXISTS "${username}"`);
    console.log(`${username} schema created`);
    await sequelize.query(`CREATE TABLE IF NOT EXISTS "${username}".fighters (LIKE fighters INCLUDING ALL)`);
    await sequelize.query(`
    INSERT INTO "${username}".fighters (
      "fighterId", "fighter", "rosterId", "displayName"
      )
    SELECT
      "fighterId", "fighter", "rosterId", "displayName"
    FROM
      fighters
    `)
    console.log(`fighter table has been added to ${username}`);
    res.status(201).json(user);
  } catch (e: any) {
    res.status(400).json(e);
    console.error(`Error creating schema: ${e}`);
  }
}

async function deleteUser(req: Req, res: Res, next: any) {
  const user = await User.destroy({
    truncate: true
  });
  res.status(204).json(user);
}
module.exports = {
  createUser,
  deleteUser,
}
