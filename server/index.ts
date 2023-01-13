require('dotenv/config');
var express = require('express');
const expressJSON = express.json();
import errorMiddleware from './utils/error-middleware';
const staticMiddleware = require('./utils/static-middleware');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const cors = require('cors');
const port = process.env.PORT || 5001;
const app = express();
app.use(cors());
app.use('/api', expressJSON);
const swaggerDocument = YAML.load('./openapi.yml');
app.use(staticMiddleware);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.use(function (req: any, res: any, next: any) {
  // Required to bypass CORS during development
  res.header("Access-Control-Allow-Origin", '*');
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

// All routes referenced here
const getRoutes = require('./routes/get-routes');
const postRoutes = require('./routes/post-routes');
const updateRoutes = require('./routes/update-routes');
const deleteRoutes = require('./routes/delete-routes');
app.use('/api/get', getRoutes);
app.use('/api/add', postRoutes);
app.use('/api/update', updateRoutes);
app.use('/api/delete', deleteRoutes);

app.use(errorMiddleware);

app.listen(port, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${port}`);
});
