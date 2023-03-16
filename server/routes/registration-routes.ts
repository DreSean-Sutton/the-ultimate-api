const { User } = require('../model/user-database');
import { Sequelize } from 'sequelize';
import ClientError from '../utils/client-error';
import { client } from '../conn';
import { Req, Res, QueryString } from '../utils/types-routes';

var express = require('express');
const registrationRoutes = express.Router();

registrationRoutes.post('/sign-up', async (req: Req, res: Res, next: (param1: any) => any) => {
  const email = 'test_email';
  const username = 'test_username';
  const password = 'test_password';

  const user = await User.create({
    email: email,
    username: username,
    password: password
  })
  res.status(201).json(user);
})

registrationRoutes.delete('/delete-account', async (req: Req, res: Res, next: (para1: any) => any) => {
  const user = await User.destroy({
    truncate: true
  });
})
module.exports = registrationRoutes;
