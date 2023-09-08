import ClientError from '../utils/client-error';
import { client } from '../conn';
import { Req, Res } from '../utils/types-routes';
const deleteController = require('./deleteController');
var express = require('express');
const deleteRoutes = express.Router(); // Base route: 'api/delete'

deleteRoutes.delete('/:table/:id', deleteController.deleteFromTable);

module.exports = deleteRoutes;
