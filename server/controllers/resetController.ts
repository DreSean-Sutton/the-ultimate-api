import { Req, Res } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client } from '../conn';
import { Op } from "sequelize";
import emailMiddleware from "../lib/email-lib";
require('dotenv/config');
const jwt = require('jsonwebtoken');
const { sequelize } = require('../conn');
const { User } = require('../model/user-table');
const { authorizeUser } = require('../lib/authorizeUser');

async function changeUsername(req: Req, res: Res, next: any) {
  const { authorization, username } = req.headers;

  try {
    const userIsTrue = authorization || username;
    const authResult = userIsTrue ? await authorizeUser(authorization, username, next) : null;
    if (!authResult.dataValues) throw new ClientError(authResult.status, authResult.message);
    const emailResult = await emailMiddleware('Dre Sean', 'dreseansutton@gmail.com', 'Password Reset', "Here's your password reset!", next);
    console.log({ emailResult });
    return res.status(200).json({emailResult: emailResult });
  } catch(e: any) {
    console.error('Error changing username: ', e);
    next(e);
  }
}

async function resetPassword(req: Req, res: Res, next: any) {
  return {};
}

module.exports = {
  changeUsername,
  resetPassword,
}
