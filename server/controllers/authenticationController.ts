import { Req, Res } from '../utils/types-routes';
import ClientError from '../utils/client-error';
import buildUserSchema from '../utils/build-user-schema';
import defineUserDb from '../utils/define-user-db';
import handleRestartIds from '../utils/handle-restart-id';
require('dotenv/config');
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
    const { dataValues } = await User.create({
      email: email,
      username: username,
      password: hashedPassword
    })
    delete dataValues.password;
    console.log(dataValues);
    // for developmental testing purposes
    if(process.env.NODE_ENV === 'development') {
      await sequelize.query(`DROP SCHEMA IF EXISTS "${username}" cascade;`);
    }

    await sequelize.query(`CREATE SCHEMA IF NOT EXISTS "${username}"`);
    console.log(`${username} schema created`);
    defineUserDb(username);
    await sequelize.sync({ schema: username });
    console.log(`${username} tables have been synced`);
    await sequelize.query(buildUserSchema(username));
    await sequelize.sync({ schema: username });
    console.log(`All public tables have been added to ${username}`);
    handleRestartIds(username);
    res.status(201).json({ message: 'Registration successful', data: dataValues });
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
    const months = 1;
    const expiration = Math.floor(Date.now() / 1000) + 60 * 60 * 24 * 30 * months;
    const token = await jwt.sign({ userId: user.dataValues.id, exp: expiration }, process.env.TOKEN_SECRET);
    user.token = token;
    user.tokenExpiration = new Date(expiration * 1000);
    await user.save();
    res.status(200).json({ token: token, expiration: `Token expires in ${months} month` });
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
