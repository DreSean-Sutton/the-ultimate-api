import { Req, Res } from '../utils/types-routes';
import ClientError from '../utils/client-error';
import buildUserSchema from '../utils/build-user-schema';
const { User, Fighters } = require('../model/user-database');
const { sequelize } = require('../model/user-database');
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
    await sequelize.query(`
      CREATE TABLE IF NOT EXISTS
        "${username}".fighters (LIKE fighters INCLUDING ALL);
      CREATE TABLE IF NOT EXISTS
        "${username}".moves (LIKE moves INCLUDING ALL);
      CREATE TABLE IF NOT EXISTS
        "${username}".hitboxes (LIKE hitboxes INCLUDING ALL);
      CREATE TABLE IF NOT EXISTS
        "${username}".throws (LIKE throws INCLUDING ALL);
      CREATE TABLE IF NOT EXISTS
        "${username}".grappling (LIKE grappling INCLUDING ALL);
      CREATE TABLE IF NOT EXISTS
        "${username}".movements (LIKE movements INCLUDING ALL);
      CREATE TABLE IF NOT EXISTS
        "${username}".dodging (LIKE dodging INCLUDING ALL);
      CREATE TABLE IF NOT EXISTS
        "${username}".stats (LIKE stats INCLUDING ALL);
      CREATE TABLE IF NOT EXISTS
        "${username}".miscellaneous (LIKE miscellaneous INCLUDING ALL);
      `);
    await sequelize.query(buildUserSchema(username));
    console.log(`All public tables have been added to ${username}`);
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
