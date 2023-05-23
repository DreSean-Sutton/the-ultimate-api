import ClientError from '../utils/client-error';
const jwt = require('jsonwebtoken');
const { User } = require('../model/user-database');
require('dotenv/config');

export async function authorizeUser(authorization: string, username: string, next: any) {
  try {
    if(!authorization) throw new ClientError(400, '(authorization) header must have a value');
    if(!username) throw new ClientError(400, '(username) header must have a value');

    const userFindResult = await User.findOne({
      where: {
        username: username
      }
    })
    if(!userFindResult) throw new ClientError(401, `Username (${username}) doesn't exist`);
    const currentTime = new Date();
    if(currentTime > userFindResult.tokenExpiration) throw new ClientError(401, 'Token has expired. Please log in to receive another');
    const token = authorization && authorization.split(' ')[1]; // Checks if authorization is truthy, then splits 'Bearer' from it's value

    // Token will not be verified if the username is 'test_username' while in a non-production env
    // Used specifically for testing purposes
    if(username !== 'test_username' && process.env.NODE_ENV !== 'production') {
      if (token !== userFindResult.token) throw new ClientError(401, 'Invalid authorization token');
    }
    jwt.verify(token, process.env.TOKEN_SECRET, (err: any) => {
      if(err) throw new ClientError(401, 'incorrect authorization header');
    });
  } catch(e) {
    next(e);
  }

}
