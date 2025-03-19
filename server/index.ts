require('dotenv/config');
import errorMiddleware from './utils/error-middleware';
import { loadEnvFromSSM } from './lib/loadEnvFromSSM';

const express = require('express');
const rateLimiterMiddleware = require('./utils/rate-limiter-middleware');
const staticMiddleware = require('./utils/static-middleware');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const cors = require('cors');

const port = process.env.PORT || 5000;
const expressJSON = express.json();
const app = express();

(async () => {
  try {
    // Load environment variables from SSM before starting the app
    await loadEnvFromSSM();

    app.use(cors());
    app.use('/api', expressJSON);
    app.use('/api', rateLimiterMiddleware);

    // Load Swagger/OpenAPI documentation
    const swaggerDocument = YAML.load('./openapi.yml');
    app.use(staticMiddleware);
    app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

    // Load routes
    const getRoutes = require('./controllers/getRoutes');
    const postRoutes = require('./controllers/postRoutes');
    const updateRoutes = require('./controllers/updateRoutes');
    const deleteRoutes = require('./controllers/deleteRoutes');
    const authenticationRoutes = require('./controllers/authenticationRoutes');
    const resetRoutes = require('./controllers/resetRoutes');

    app.use('/api/get', getRoutes);
    app.use('/api/add', postRoutes);
    app.use('/api/update', updateRoutes);
    app.use('/api/delete', deleteRoutes);
    app.use('/api/auth', authenticationRoutes);
    app.use('/api/reset', resetRoutes);

    app.use(errorMiddleware);

    app.listen(port, () => {
      console.log(`✅ Express server listening on port ${port}`);
    });
  } catch (err) {
    console.error('❌ Failed to start the app:', err);
    process.exit(1); // Exit if SSM loading fails to avoid partial app state
  }
})();
