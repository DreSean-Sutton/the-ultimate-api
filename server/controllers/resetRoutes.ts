const resetControllers = require('./resetController');
var express = require('express');
const resetRoutes = express.Router(); // base route: 'api/reset'

resetRoutes.post('/username', resetControllers.changeUsername);
resetRoutes.post('/password', resetControllers.resetPassword);
module.exports = resetRoutes;
