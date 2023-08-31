const { sequelize } = require('./conn');
const {
  Fighters,
  Moves,
  Hitboxes,
  Throws,
  Grappling,
  Movements,
  Dodging,
  Stats,
  Miscellaneous
} = require('./model/all-fighter-data');

require('dotenv/config');
import errorMiddleware from './utils/error-middleware';
var express = require('express');
const rateLimiterMiddleware = require('./utils/rate-limiter-middleware');
const staticMiddleware = require('./utils/static-middleware');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const cors = require('cors');

const port = process.env.PORT || 5000;
const expressJSON = express.json();
const app = express();
app.use(cors());
app.use('/api', expressJSON);
const swaggerDocument = YAML.load('./openapi.yml');
app.use(staticMiddleware);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
app.use('/api', rateLimiterMiddleware);

// All routes referenced here
const getRoutes = require('./controllers/getRoutes');
const postRoutes = require('./controllers/postRoutes');
const updateRoutes = require('./controllers/updateRoutes');
const deleteRoutes = require('./controllers/deleteRoutes');
const authenticationRoutes = require('./controllers/authenticationRoutes');
app.use('/api/get', getRoutes);
app.use('/api/add', postRoutes);
app.use('/api/update', updateRoutes);
app.use('/api/delete', deleteRoutes);
app.use('/api/auth', authenticationRoutes);

app.use(errorMiddleware);

app.listen(port, () => {
  console.log(`express server listening on port ${port}`);
});
