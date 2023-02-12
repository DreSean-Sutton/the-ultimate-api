const {
  User,
  Fighters,
  Moves,
  Hitboxes,
  Throws,
  Grappling,
  Movements,
  Dodging,
  Stats,
  Miscellaneous,
  sequelize
} = require('./model/user-database');

require('dotenv/config');
var express = require('express');
import errorMiddleware from './utils/error-middleware';
const staticMiddleware = require('./utils/static-middleware');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const cors = require('cors');

const port = process.env.PORT || 5001;
const expressJSON = express.json();
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
const deleteRoutes = require('./routes/delete-routes');
const registrationRoutes = require('./routes/registration-routes');
app.use('/api/get', getRoutes);
app.use('/api/add', postRoutes);
app.use('/api/update', updateRoutes);
app.use('/api/delete', deleteRoutes);
app.use('/api/registration', registrationRoutes);

app.use(errorMiddleware);


app.listen(port, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${port}`);
});

// try {
//   sequelize.authenticate().then(() => console.log('Connection has been established successfully.'));
// } catch (error) {
//   console.error('Unable to connect to the database:', error);
// }

// sequelize.sync({ force: true })
//   .then(() => {
//     console.log('User schema and User table created');
//   });
