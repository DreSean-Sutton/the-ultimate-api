import ClientError from '../utils/client-error';
const jwt = require('jsonwebtoken');
const { User } = require('../model/user-table');
require('dotenv/config');

export async function authorizeUser(authorization: string, username: string, next: any): Promise<{ status: number, message: string } | undefined> {
  try {
    if (!authorization) {
      throw { status: 400, message: '(authorization) header must have a value' };
    }
    if (!username) {
      throw { status: 400, message: '(username) header must have a value' };
    }
    if (!/^Bearer/.test(authorization)) {
      throw { status: 400, message: "(authorization) header must start with 'Bearer '" };
    }

    const userFindResult = await User.findOne({
      where: {
        username: username
      }
    });
    if (!userFindResult) {
      throw { status: 401, message: `Username (${username}) doesn't exist` };
    }
    if(!userFindResult.token) {
      throw { status: 401, message: "You don't have a token. Please log in first." };
    }
    const currentTime = new Date();
    if (currentTime > userFindResult.tokenExpiration) {
      throw { status: 401, message: 'Token has expired. Please log in to receive another' };
    }
    const token = authorization && authorization.split(' ')[1]; // Checks if authorization is truthy, then splits 'Bearer' from its value

    // Token will not be verified if the username is 'test_username' while in a non-production env
    // Used specifically for testing purposes
    if (username !== 'test_username' && username !== 'other_test_username' && process.env.NODE_ENV !== 'production') {
      if (token !== userFindResult.token) {
        throw { status: 401, message: 'Invalid authorization token' };
      }
    }

    jwt.verify(token, process.env.TOKEN_SECRET, (err: any) => {
      if (err) {
        throw { status: 401, message: 'incorrect authorization header' };
      }
    });

    return userFindResult.dataValues;
  } catch (e: any) {
    return e;
  }
}
