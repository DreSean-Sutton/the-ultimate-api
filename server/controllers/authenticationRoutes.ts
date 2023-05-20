const authenticationController = require('../controllers/authenticationController');

var express = require('express');
const authenticationRoutes = express.Router();

authenticationRoutes.post('/register', authenticationController.registerUser);
authenticationRoutes.post('/show-token', authenticationController.showToken);
authenticationRoutes.post('/generate-token', authenticationController.generateToken);
authenticationRoutes.delete('/delete-account', authenticationController.deleteUser);

module.exports = authenticationRoutes;
