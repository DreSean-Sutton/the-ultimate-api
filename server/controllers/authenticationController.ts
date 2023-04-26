import { Req, Res } from '../utils/types-routes';
import ClientError from '../utils/client-error';
import buildUserSchema from '../utils/build-user-schema';
import defineUserDb from '../utils/define-user-db';
require('dotenv/config');
const crypto = require('crypto');
const { User } = require('../model/user-database');
const { sequelize } = require('../conn');
const argon2 = require('argon2');
const jwt = require('jsonwebtoken');

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
    const hashedPassword = await argon2.hash(password);
    const user = await User.create({
      email: email,
      username: username,
      password: hashedPassword
    })
    await sequelize.query(`DROP SCHEMA IF EXISTS "${username}" cascade;`); // for developmental testing purposes
    await sequelize.query(`CREATE SCHEMA IF NOT EXISTS "${username}"`);
    console.log(`${username} schema created`);
    defineUserDb(sequelize, username);
    await sequelize.sync({ schema: username });
    console.log(`${username} tables have been synced`);
    await sequelize.query(buildUserSchema(username));
    await sequelize.sync({ schema: username });
    console.log(`All public tables have been added to ${username}`);
    const userFighterModel = sequelize.model('fighters', null, { schema: username });
    const maxFighterId = await userFighterModel.max('fighterId');
    await sequelize.query(`ALTER SEQUENCE "${username}"."fighters_fighterId_seq" RESTART WITH ${maxFighterId + 1}`);
    console.log("Fighters model's fighterId incrementation value has been synced");
    res.status(201).json(user);
  } catch (e: any) {
    res.status(400).json(e);
    console.error(`Error creating schema: ${e}`);
  }
}

async function authenticateUser(req: Req, res: Res, next: any) {
  try {
    const { email, password } = req.body;
    if(!email || !email.includes('@') || !password) {
      return res.status(400).json({ error: 'Must provide valid email and password'});
    }
    const user = await User.findOne({ where: { email: email }});
    if(!user) {
      return res.status(401).json({ error: 'Invalid email'});
    }
    const isValidPassword = await argon2.verify(user.dataValues.password, password);
    if(!isValidPassword) {
      return res.status(401).json({ error: 'Invalid password'});
    }
    const minutes = 30;
    const expiration = Math.floor(Date.now() / 1000) + 60 * minutes;
    const token = await jwt.sign({ userId: user.dataValues.id, exp: expiration }, process.env.TOKEN_SECRET);
    user.token = token;
    user.tokenExpiration = new Date(expiration * 1000);
    await user.save();
    res.status(200).json({ token: token, expiration: `Token expires in ${minutes} minute(s)` });
  } catch(e: any) {
    console.error(`error authenticating user: ${e}`);
    next(e);
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
  authenticateUser,
  deleteUser,
}
