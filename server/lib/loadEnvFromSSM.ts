import { SSMClient, GetParametersCommand } from '@aws-sdk/client-ssm';

const ssm = new SSMClient({
  region: 'us-east-1'
});

const PARAMETER_NAMES = [
  'the-ultimate-api/DATABASE_URL',
  'the-ultimate-api/DB_NAME',
  'the-ultimate-api/EMAIL_PASSWORD',
  'the-ultimate-api/EMAIL_USER',
  'the-ultimate-api/NODE_ENV',
  'the-ultimate-api/PORT',
  'the-ultimate-api/TOKEN_SECRET',
];

export async function loadEnvFromSSM() {
  if (process.env.NODE_ENV !== 'production') {
    console.log('Skipping SSM loading - running in development');
    return;
  }

  try {
    console.log('Loading environment variables from SSM...');

    const command = new GetParametersCommand({
      Names: PARAMETER_NAMES,
      WithDecryption: true
    });

    const response = await ssm.send(command);

    // Assign loaded values to process.env
    response.Parameters?.forEach((param) => {
      if (param.Name) {
        const key = param.Name.split('/').pop(); // Extract last part of the path as the key
        if (key) {
          process.env[key] = param.Value || '';
          console.log(`✅ Loaded ${key} from SSM`);
        }
      }
    });

    // Warn if some parameters were missing
    const loadedParams = response.Parameters?.map(p => p.Name) || [];
    const missingParams = PARAMETER_NAMES.filter(name => !loadedParams.includes(name));

    if (missingParams.length) {
      console.warn(`⚠️ Missing parameters from SSM: ${missingParams.join(', ')}`);
    }

  } catch (error) {
    console.error('❌ Failed to load SSM parameters:', error);
    throw error; // Fail fast if env loading fails
  }
}
