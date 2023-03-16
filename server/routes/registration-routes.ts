import ClientError from '../utils/client-error';
import { client } from '../conn';
import { Req, Res, QueryString } from '../utils/types-routes';

var express = require('express');
const registrationRoutes = express.Router();

registrationRoutes.post('/sign-up', async (req: Req, res: Res, next: (param1: any) => any) => {
  const schemaName = 'test_schema';
  const tableName = 'test_table';

  const createSchemaQuery = `CREATE SCHEMA IF NOT EXISTS ${schemaName}`;
  const createTableQuery = `
  CREATE TABLE IF NOT EXISTS ${schemaName}.${tableName} (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL
  )
`;

  client.query(createSchemaQuery)
    .then(() => client.query(createTableQuery))
    .then(() => {
      res.status(201).json({ message: (`Schema "${schemaName}" and table "${schemaName}.${tableName}" created.`)});
    })
    .catch((err: any) => {
      console.error(err);
      res.status(404).json({ error: err })
    });
})
module.exports = registrationRoutes;
