const { User } = require('../model/user-database');
const registrationController = require('../controllers/registrationController');
import { Req, Res, QueryString } from '../utils/types-routes';

var express = require('express');
const registrationRoutes = express.Router();

registrationRoutes.post('/sign-up', registrationController.createUser);

registrationRoutes.delete('/delete-account', registrationController.deleteUser)

module.exports = registrationRoutes;
