const postControllers = require('../controllers/postController');
var express = require('express');
const postRoutes = express.Router(); // base route: 'api/add'


postRoutes.post('/fighters', postControllers.postFighters);
postRoutes.post('/:table/:id', postControllers.postTableData);

module.exports = postRoutes;
