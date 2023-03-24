const { User } = require('../model/user-database');
const { sequelize } = require('../model/user-database');
import { Req, Res, QueryString } from '../utils/types-routes';

async function createUser(req: Req, res: Res, next: any) {

  const { email, username, password } = req.body;
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
