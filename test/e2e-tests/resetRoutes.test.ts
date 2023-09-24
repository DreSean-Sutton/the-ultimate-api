import chai from "chai";
import sinon from "sinon";
import chaiHttp from "chai-http";
import nock from "nock";
const request = require("supertest");
const resetControllers = require('../../server/controllers/resetController');
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
  afterEach(() => {
    nock.cleanAll();
  });
  const url = 'http://localhost:5000';
  const path = '/api/reset/get-reset-token';

  describe("successful requests", () => {
    it("should send a token to a user's email address", async () => {
      nock(url).post(path).reply(200, {
          status: 200, body: { accepted: ['test_email@gmail.com'], rejected: [] }
        });

        const res = await request(url).post(path)
          .set('Content-Type', 'application/json')
          .send({
            email: 'test_email@gmail.com'
          })
        res.should.have.status(200);
        res.body.should.not.have.property('error');
      // chai.request(url)
      //   .post(path)
      //   .set('Content-Type', 'application/json')
      //   .send({ email: 'test_email@gmail.com' })
      //   .end((err, res) => {
      //     if(err) {
      //       console.log('An error has occurred: ', err);
      //       return done(err);
      //     }
      //     console.log(res.body);
      //     res.should.have.status(200);
      //     res.body.should.not.have.property('error');
      //     done();
      //   })

    });
  });
  describe("Unsuccessful Requests", () => {
    it("Returns a 404 request if email doesn't exist", async () => {
      nock(url).post(path).reply(404, {
        error: "Email doesn't exist"
      });

      const res = await request(url).post(path)
        .set('Content-Type', 'application/json')
        .send({
          email: 'i_dont_exist@gmail.com'
        })
      res.should.have.status(404);
      res.body.should.have.property('error');
    });
  });
});

describe.only("PUT /api/reset/information", () => {
  const url = 'http://localhost:5000';
  const path = '/api/reset/information';

  describe("Successful Requests", () => {
    it("Returns a 200 status code if information is reset", done => {
      chai.request(url)
        .put(path)
        .set('Content-Type', 'application/json')
        .send({ email: 'changed_test_email@gmail.com', username: 'changed_test_username', password: 'changed_test_password' })
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(200);
          res.body.should.have.keys(['email', 'username', 'password']);
          done();
        })
    });
  });
  describe("Unsuccessful Requests", () => {

  });
});
