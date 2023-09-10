import chai from "chai";
import sinon from "sinon";
import chaiHttp from "chai-http";
require('dotenv/config');
const jwt = require('jsonwebtoken');
chai.should();
chai.use(chaiHttp);

const testPayload = {
  userId: 123,
  exp: Math.floor(Date.now() / 1000) + (60 * 30)
};
const testToken = jwt.sign(testPayload, process.env.TOKEN_SECRET);

describe.only("POST /api/reset/getResetToken", () => {
  const url = 'http://localhost:5000';
  const path = '/api/reset/get-reset-token';

  describe("successful requests", () => {
    it("should send a token to a user's email address", done => {
      chai.request(url)
        .post(path)
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ email: 'test_email@gmail.com' })
        .end((err, res) => {
          if(err) {
            console.log('An error has occurred: ', err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(200);
          res.body.should.not.have.property('error');
          done();
        })

    });
  });
});
