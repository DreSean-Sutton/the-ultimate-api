const registrationController = require('../controllers/registrationController');

var express = require('express');
const registrationRoutes = express.Router();

registrationRoutes.post('/sign-up', registrationController.createUser);

registrationRoutes.delete('/delete-account', registrationController.deleteUser)

module.exports = registrationRoutes;
