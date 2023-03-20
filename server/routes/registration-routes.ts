const { User } = require('../model/user-database');
const { sequelize } = require('../model/user-database');

import ClientError from '../utils/client-error';
import { client } from '../conn';
import { Req, Res, QueryString } from '../utils/types-routes';

var express = require('express');
const registrationRoutes = express.Router();

registrationRoutes.post('/sign-up', async (req: Req, res: Res, next: (param1: any) => any) => {

  const { email, username, password } = req.body;
  try {
    await sequelize.query('CREATE SCHEMA IF NOT EXISTS "user"');
    console.log('User schema created');
    await User.sync({ force: false });
    console.log('User table created');
    console.log(req.body);
    console.log({ email, username, password });
    const user = await User.create({
      email: email,
      username: username,
      password: password
    })
    res.status(201).json(user);
  } catch(e: any) {
    res.status(400).json(e);
    console.error(`Error creating schema: ${e}`);
  }
})

registrationRoutes.delete('/delete-account', async (req: Req, res: Res, next: (para1: any) => any) => {
  const user = await User.destroy({
    truncate: true
  });
  res.status(204).json(user);
})
module.exports = registrationRoutes;
