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
          status: 200, body: { message: "Token has been successfully sent to your email (test_email@gmail.com)" }
        });

        const res = await request(url).post(path)
          .set('Content-Type', 'application/json')
          .send({
            email: 'test_email@gmail.com'
          })
        res.should.have.status(200);
        res.body.should.not.have.property('error');
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
  afterEach(() => {
    nock.cleanAll();
  });

  const url = 'http://localhost:5000';
  const path = '/api/reset/information';

  describe("Successful Requests", () => {
    it("Returns a 200 status code if information is reset", async () => {
      nock(url).put(path).reply(200, { message: "Information has successfully been changed." });

      const res = await request(url).put(path).set('Content-Type', 'application/json')
        .send({ email: 'changed_test_email@gmail.com', username: 'changed_test_username', password: 'changed_test_password', resetToken: 'reset_token' });
        res.should.have.status(200);
        res.body.should.not.have.property('error');
    });
  });
  describe("Unsuccessful Requests", () => {
    it("Returns a 404 status code if reset token isn't found", async ()  => {
      nock(url).put(path).reply(404, {
        error: "Reset token not found"
      });

      const res = await request(url)
        .put(path)
        .send({ email: 'changed_test_email@gmail.com', username: 'changed_test_username', password: 'changed_test_password', resetToken: 'not_found_reset_token' });
      res.should.have.status(404);
      res.body.should.have.property('error');
    });

    it("Returns a 410 status code if reset token has expired", async () => {
      nock(url).put(path).reply(410, {
          error: "reset token has expired."
      });

      const res = await request(url)
        .put(path)
        .send({ email: 'changed_test_email@gmail.com', username: 'changed_test_username', password: 'changed_test_password', resetToken: 'expired_reset_token' });
      res.should.have.status(410);
      res.body.should.have.property('error');
    });
    it("Returns a 401 status code if no information was changed", async () => {
      nock(url).put(path).reply(401, {
          error: "No information changed. New information must be different from old information."
      });

      const res = await request(url)
        .put(path)
        .send({ email: 'test_email@gmail.com', username: 'test_username', password: 'test_password', resetToken: 'reset_token' });
      res.should.have.status(401);
      res.body.should.have.property('error');
    });
  });
});
