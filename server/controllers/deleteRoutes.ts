import ClientError from '../utils/client-error';
import { client } from '../conn';
import { Req, Res } from '../utils/types-routes';
const deleteController = require('../controllers/deleteController');
var express = require('express');
const deleteRoutes = express.Router(); // Base route: 'api/delete'

/**
 * Delete route that removes data from a table and id of your choice
 * @param { string } table // fighters, moves, throws, movements, or stats
 * @param { number } id   // fighterId, moveId, throwId, movementId, or statId
 * @return 204 status code
 */
deleteRoutes.delete('/:table/:id', deleteController.deleteUnit);

module.exports = deleteRoutes;
