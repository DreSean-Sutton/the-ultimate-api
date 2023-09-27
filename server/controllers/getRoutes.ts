import ClientError from '../utils/client-error';
import { client } from '../conn';
var express = require('express');
const getController = require('./getController');
const getRoutes = express.Router();

getRoutes.get('/fighters', getController.getFighters);
getRoutes.get('/fighters/data', getController.getFightersData);
getRoutes.get('/fighters/data/:type', getController.getFightersDataByType);

module.exports = getRoutes;
