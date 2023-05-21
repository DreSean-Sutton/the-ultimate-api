const path = require('path');
var express = require('express');

const publicPath = path.join(__dirname, '../../public');
const staticMiddleware = express.static(publicPath);

module.exports = staticMiddleware;
