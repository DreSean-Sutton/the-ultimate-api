const resetControllers = require('./resetController');
var express = require('express');
const resetRoutes = express.Router(); // base route: 'api/reset'

resetRoutes.post('/get-reset-token', resetControllers.getResetToken);
resetRoutes.put('/information', resetControllers.changeInformation);
module.exports = resetRoutes;
