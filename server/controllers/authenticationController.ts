import { Req, Res } from '../utils/types-routes';
import ClientError from '../utils/client-error';
import buildUserSchema from '../lib/build-user-schema';
import defineUserDb from '../lib/define-user-db';
import handleRestartIds from '../lib/handle-restart-id';
require('dotenv/config');
const { User } = require('../model/user-table');
const { sequelize } = require('../conn');
const argon2 = require('argon2');
const jwt = require('jsonwebtoken');

async function registerUser(req: Req, res: Res, next: any) {

  const { email, username, password } = req.body;
  const { emptyDB }: any = req.query;
  if (!email || !email.includes('@') || !username || !password) {
    return res.status(400).json({ error: 'Must be a valid email, username, and password' });
  }
  try {
    await sequelize.query('CREATE SCHEMA IF NOT EXISTS "user"');
    console.log('User schema created');
    await User.sync();
    console.log('User table created');
    const hashedPassword = await argon2.hash(password);
    const { dataValues } = await User.create({
      email: email,
      username: username,
      password: hashedPassword
    })
    delete dataValues.password;

    if(process.env.NODE_ENV === 'development') { // Only for developmental testing purposes
      await sequelize.query(`DROP SCHEMA IF EXISTS "${username}" cascade;`);
    }

    await sequelize.query(`CREATE SCHEMA IF NOT EXISTS "${username}"`);
    console.log(`${username} schema created`);
    defineUserDb(username);
    await sequelize.sync({ schema: username });
    console.log(`${username} tables have been synced`);
    if(!emptyDB) {
      await sequelize.query(buildUserSchema(username));
      await sequelize.sync({ schema: username });
      console.log(`All public tables have been added to ${username}`);
      handleRestartIds(username);
    }
    res.status(201).json({ message: 'Registration successful', data: dataValues });
  } catch (e: any) {
    res.status(400).json(e);
    console.error(`Error creating schema: ${e}`);
  }
}

async function showToken(req: Req, res: Res, next: any) {
  try {
    const { email, password } = req.body;
    if(!email || !email.includes('@') || !password) {
      throw new ClientError(400, 'Must provide valid email and password');
    }
    const user = await User.findOne({ where: { email: email }});
    if(!user) {
      throw new ClientError(401, 'Invalid email');
    }
    const isValidPassword = await argon2.verify(user.dataValues.password, password);
    if(!isValidPassword) {
      throw new ClientError(401, 'Invalid password');
    }
    const { token, tokenExpiration } = user.dataValues;
    if(!token) {
      throw new ClientError(401, "Token doesn't exist. Please generate a token");
    }
    res.status(200).json({ token: token, expirationDate: tokenExpiration });
  } catch(e) {
    console.error(`error authenticating user: ${e}`);
    next(e);
  }
}

async function generateToken(req: Req, res: Res, next: any) {
  try {
    const { email, password } = req.body;
    if(!email || !email.includes('@') || !password) {
      throw new ClientError(400, 'Must provide valid email and password');
    }
    const user = await User.findOne({ where: { email: email }});
    if(!user) {
      throw new ClientError(401, 'Invalid email');
    }
    const isValidPassword = await argon2.verify(user.dataValues.password, password);
    if(!isValidPassword) {
      throw new ClientError(401, 'Invalid password');
    }
    const months = 1;
    const expiration = Math.floor(Date.now() / 1000) + 60 * 60 * 24 * 30 * months;
    const token = await jwt.sign({ userId: user.dataValues.id, exp: expiration }, process.env.TOKEN_SECRET);
    user.token = token;
    user.tokenExpiration = new Date(expiration * 1000);
    await user.save();
    res.status(200).json({ token: token, expiration: `${months} month` });
  } catch(e: any) {
    console.error(`error authenticating user: ${e}`);
    next(e);
  }
}

async function resetTests(req: Req, res: Res, next: any) {
  if(process.env.NODE_ENV !== 'development') return;
  try {
    const userQuery = `
      SELECT *
      FROM information_schema.schemata
      WHERE schema_name = 'user'
    `;
    const [userQueryResult] = await sequelize.query(userQuery);
    const user = await User.destroy({ truncate: true });
    await sequelize.query('DROP SCHEMA IF EXISTS "test_username" cascade;');
    await sequelize.query('DROP SCHEMA IF EXISTS "other_test_username" cascade;');
    res.status(204).json(user);
  } catch(e) {
    console.error('Error deleting users:', e);
    res.status(500).json({ error: 'Error deleting users' });
  }
}

module.exports = {
  registerUser,
  showToken,
  generateToken,
  resetTests,
}
