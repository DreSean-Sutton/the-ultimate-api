const updateControllers = require('./updateController');
var express = require('express');
const updateRoutes = express.Router(); // base route: 'api/update'


updateRoutes.put('/:table/:id', updateControllers.updateTableData);

module.exports = updateRoutes;
