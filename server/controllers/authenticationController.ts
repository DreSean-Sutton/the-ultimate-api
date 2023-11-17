import { Req, Res } from '../utils/types-routes';
import ClientError from '../utils/client-error';
const { authorizeUser } = require('../lib/authorizeUser');
import buildUserSchema from '../lib/build-user-schema';
import defineUserDb from '../lib/define-user-db';
import handleRestartIds from '../lib/handle-restart-id';
import generateRandomString from '../lib/generate-random-string';
require('dotenv/config');
const { User } = require('../model/user-table');
const { Reset } = require('../model/reset-table');
const { sequelize } = require('../conn');
const { Op } = require('sequelize');
const argon2 = require('argon2');
const jwt = require('jsonwebtoken');
let testSchemaName: string = '';

async function registerUser(req: Req, res: Res, next: any) {

  const { email, username, password } = req.body;
  const { emptyDB }: { emptyDB?: string } = req.query;

  if (!email || !email.includes('@') || !username || !password) {
    return res.status(400).json({ error: 'Must be a valid email, username, and password' });
  }
  try {
    await sequelize.query('CREATE SCHEMA IF NOT EXISTS "user"');
    console.log('User schema created');
    await sequelize.sync({ schema: 'user' });
    console.log('User table created');
    await sequelize.query('CREATE SCHEMA IF NOT EXISTS "reset"');
    console.log('Reset schema created');
    await sequelize.sync({ schema: 'reset' });
    console.log('Reset table created');

    const checkUniqueUser = await User.findOne({
      where: {
        [Op.or]: [{ username: username}, { email: email }]
      }
    });
    if(checkUniqueUser) {
      throw checkUniqueUser.email ? new ClientError(400, "email must be unique") : new ClientError(400, "username must be unique");
    }
    if (process.env.NODE_ENV === 'development' && testSchemaName) { // Only for developmental testing purposes
      await sequelize.query(`DROP SCHEMA IF EXISTS "${testSchemaName}" cascade;`);
    }
    const randomString = generateRandomString(32);
    const hashedPassword = await argon2.hash(password);
    const { dataValues } = await User.create({
      email: email,
      username: username,
      password: hashedPassword,
      userDB: `${randomString}`
    });

    await sequelize.query(`CREATE SCHEMA IF NOT EXISTS "${dataValues.userDB}"`);
    console.log(`${dataValues.userDB} schema created`);
    await defineUserDb(dataValues.userDB);
    await sequelize.sync({ schema: dataValues.userDB });
    console.log(`${username}'s tables have been synced`);
    if (!emptyDB || emptyDB === 'false') {
      await sequelize.query(buildUserSchema(dataValues.userDB));
      console.log(`All public tables have been added to ${dataValues.userDB}`);
      const totalIds = await handleRestartIds(dataValues.userDB);
      dataValues.rowCount = totalIds;
      console.log("User row count has been synced");
    }
    delete dataValues.password;
    delete dataValues.userDB;
    res.status(201).json({ message: 'Registration successful', data: dataValues });
  } catch (e: any) {
    console.error(`Error creating schema: ${e}`);
    next(e);
  }
}

async function showToken(req: Req, res: Res, next: any) {
  try {
    const { email, password } = req.body;
    if (!email || !email.includes('@') || !password) {
      throw new ClientError(400, 'Must provide valid email and password');
    }
    const user = await User.findOne({ where: { email: email }});
    if (!user) {
      throw new ClientError(401, 'Invalid email');
    }
    const isValidPassword = await argon2.verify(user.dataValues.password, password);
    if (!isValidPassword) {
      throw new ClientError(401, 'Invalid password');
    }
    const { token, tokenExpiration } = user.dataValues;
    if (!token) {
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
    if (!email || !email.includes('@') || !password) {
      throw new ClientError(400, 'Must provide valid email and password');
    }
    const user = await User.findOne({ where: { email: email }});
    if (!user) {
      throw new ClientError(401, 'Invalid email');
    }
    const isValidPassword = await argon2.verify(user.dataValues.password, password);
    if (!isValidPassword) {
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

async function resetDatabase(req: Req, res: Res, next: Function) {

  // Make row count work with this function

  const { authorization, username } = req.headers;
  const userIsTrue = authorization || username;
  const { emptyDB }: { emptyDB?: string } = req.query;

  try {
    const authResult = userIsTrue ? await authorizeUser(authorization, username, next) : null;
    if (!authResult.dataValues) throw new ClientError(authResult.status, authResult.message);
    const { userDB } = authResult.dataValues;
    await sequelize.query(`DROP SCHEMA IF EXISTS "${userDB}" cascade;`);
    await sequelize.query(`CREATE SCHEMA IF NOT EXISTS "${userDB}"`);
    await defineUserDb(userDB);
    await sequelize.sync({ schema: userDB });
    console.log(`${username}'s tables have been re-synced`);
    authResult.dataValues.rowCount = 0;
    await authResult.save();
    if (!emptyDB || emptyDB === 'false') {
      await sequelize.query(buildUserSchema(userDB));
      console.log(`All public tables have been re-added to ${username}'s schema`);
      const totalIds = await handleRestartIds(authResult.dataValues.userDB);
      authResult.dataValues.rowCount = totalIds;
      console.log("User row count has been synced");
    }
    delete authResult.dataValues.password;
    delete authResult.dataValues.userDB;
    res.status(200).json({ message: 'Database reset successful', data: authResult.dataValues });
  } catch (e: any) {
    console.error(`Error creating schema: ${e}`);
    res.status(400).json(e);
  }
}

async function deleteUser(req: Req, res: Res, next: any) {
  const { authorization, username } = req.headers;
  const userIsTrue = authorization || username;
  try {
    const authResult = userIsTrue ? await authorizeUser(authorization, username, next) : null;
    if (!authResult.dataValues) throw new ClientError(authResult.status, authResult.message);
    await User.destroy({ where: { username: username }});
    await sequelize.query(`DROP SCHEMA IF EXISTS "${authResult.dataValues.userDB}" cascade;`);
    res.status(204).json({});
  } catch (e) {
    console.error(`error deleting user: ${e}`);
    next(e);
  }
}

async function resetTests(req: Req, res: Res, next: any) {
   // This function is used to reset e2e tests during development

  if (process.env.NODE_ENV !== 'development') return;
  try {
    await sequelize.sync({ schema: 'user' });
    const userFindResult = await User.findOne({ where: { username: 'test_username' } });
    if(userFindResult) {
      testSchemaName = userFindResult.dataValues.userDB;
    }
    await sequelize.query('DROP SCHEMA IF EXISTS "user" cascade;');
    res.status(200).json({ message: 'Tests successfully reset'});
  } catch(e) {
    console.error('Error resetting tests:', e);
    res.status(500).json({ error: 'Error resetting tests' });
  }
}

module.exports = {
  registerUser,
  showToken,
  generateToken,
  deleteUser,
  resetDatabase,
  resetTests,
}
