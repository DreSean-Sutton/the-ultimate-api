const { User } = require('../model/user-database');
const registrationController = require('../controllers/registrationController');
import { Req, Res, QueryString } from '../utils/types-routes';

var express = require('express');
const registrationRoutes = express.Router();

registrationRoutes.post('/sign-up', registrationController.createUser);

registrationRoutes.delete('/delete-account', async (req: Req, res: Res, next: (para1: any) => any) => {
  const user = await User.destroy({
    truncate: true
  });
  res.status(204).json(user);
})

module.exports = registrationRoutes;
