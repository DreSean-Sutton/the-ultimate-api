require('dotenv/config');
var express = require('express');
const expressJSON = express.json();
import ClientError from "./client-error";
import errorMiddleware from "./error-middleware";
const staticMiddleware = require('./static-middleware');
const sqlQueries = require('./sql-queries');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const cors = require('cors');
const port = process.env.PORT || 5001;
import { ReqParams, Req, QueryString, Res } from './utils/types-routes';
import { db } from './conn';
const app = express();
app.use(cors());
app.use('/api', expressJSON);
const swaggerDocument = YAML.load('./openapi.yml');

app.use(staticMiddleware);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// All routes referenced here
const getRoutes = require('./routes/get-routes');
const postRoutes = require('./routes/post-routes');
const updateRoutes = require('./routes/update-routes');
app.use('/api/fighters', getRoutes);
app.use('/api/add', postRoutes);
app.use('/api/update', updateRoutes);

app.delete('/api/delete/:table/:id', async (req: Req, res: Res, next: (param1: any) => any) => {

  try {
    if (/[A-Z]/gi.test(req.params.id) &&
      req.params.id !== undefined) {
      throw new ClientError(400, 'id must be a number');
    }
    const id = Number(req.params.id);
    let sql = '';
    const notFoundError = `${req.params.table.slice(0, req.params.table.length - 1)}Id ${id} doesn't exist`;
    const params = [id];

    if (req.params.table === 'fighters') {
      sql = `
        DELETE FROM
          public.fighters
        WHERE
          "fighterId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'moves') {
      sql = `
        DELETE FROM
          public.moves
        WHERE
          "moveId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'throws') {
      sql = `
        DELETE FROM
          public.throws
        WHERE
          "throwId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'movements') {
      sql = `
        DELETE FROM
          public.movements
        WHERE
          "movementId"=$1
        RETURNING *;
      `;
    } else if (req.params.table === 'stats') {
      sql = `
        DELETE FROM
          public.stats
        WHERE
          "statId"=$1
        RETURNING *;
      `;
    } else {
      throw new ClientError(400, `${req.params.table} is not a valid path parameter`);
    }
    const result = await db.query(sql, params);
    if (result.rowCount === 0) {
      throw new ClientError(404, notFoundError);
    }
    return res.status(204).json(result.rowCount);
  } catch (e) {
    return next(e);
  }
});

app.use(errorMiddleware);

app.listen(port, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${port}`);
});
