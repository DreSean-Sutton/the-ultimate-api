module.exports = {
  require: 'ts-node/register',
  spec: [
    'test/unit-tests/*',
    'test/e2e-tests/authenticationRoutes.test.ts',
    'test/e2e-tests/postRoutes.test.ts',
    'test/e2e-tests/updateRoutes.test.ts',
    'test/e2e-tests/getRoutes.test.ts',
    'test/e2e-tests/deleteRoutes.test.ts',
    'test/e2e-tests/resetRoutes.test.ts'
  ]
}
