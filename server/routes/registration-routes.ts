import ClientError from '../utils/client-error';
import { client } from '../conn';
import { Req, Res, QueryString } from '../utils/types-routes';

var express = require('express');
const registrationRoutes = express.Router();

registrationRoutes.post('/sign-up', async (req: Req, res: Res, next: (param1: any) => any) => {

})
module.exports = registrationRoutes;
