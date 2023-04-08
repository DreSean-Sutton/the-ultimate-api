const authenticationController = require('../controllers/authenticationController');

var express = require('express');
const authenticationRoutes = express.Router();

authenticationRoutes.post('/register', authenticationController.createUser);
authenticationRoutes.post('/login', authenticationController.authenticateUser);
authenticationRoutes.delete('/delete-account', authenticationController.deleteUser);

module.exports = authenticationRoutes;