import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
const dotenv = require('dotenv');
dotenv.config({ path: '.env' });
chai.should();
chai.use(chaiHttp);

describe("POST /api/add/fighters", () => {
  const url = 'http://localhost:5000';
  const path = '/api/add/fighters';

  describe("successful requests", () => {
    it("returns a 201 status if a fighter successfully inserted", done => {

      const returnedKeys = ['createdAt', 'updatedAt', 'fighterId', 'fighter', 'rosterId', 'displayName'];
      process.env.TEST_API_KEY = process.env.TEST_API_KEY || '';
      console.log(process.env.TEST_API_KEY);

      chai.request(url)
        .post(path)
        .set('authorization', process.env.TEST_API_KEY)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'goku', displayName: 'Son Goku', rosterId: '9001' })
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.body.should.have.all.keys(returnedKeys);
          res.should.have.status(201);
          done();
        })
    })
  })
  describe("unsuccessful requests", () => {

  })
})
