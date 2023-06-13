import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
require('dotenv/config');
const jwt = require('jsonwebtoken');
chai.should();
chai.use(chaiHttp);

const testPayload = {
  userId: 123,
  exp: Math.floor(Date.now() / 1000) + (60 * 30)
};
const testToken = jwt.sign(testPayload, process.env.TOKEN_SECRET);

describe.only("PUT /api/update/fighters/id", () => {
  const url = 'http://localhost:5000';
  const path = '/api/update/fighters/90';

  describe("Successfulful requests", () => {
    it("returns a 200 status if a fighter's successfully updated", done => {

      chai.request(url)
        .put(path)
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'gokus', displayName: 'Son Gokus', rosterId: 9002 })
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(200);
          res.body[0].should.equal(1);
          done();
        })
    })
    it("returns a 200 status if a fighter's successfully updated", done => {

      chai.request(url)
        .put('/api/update/fighters/91')
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'krillins', displayName: 'Krillins', rosterId: 525 })
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(200);
          res.body[0].should.equal(1);
          done();
        })
    })
    it("returns a 200 status if a fighter's rosterId is successfully updated", done => {

      chai.request(url)
        .put(path)
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({  rosterId: 9003 })
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(200);
          res.body[0].should.equal(1);
          done();
        })
    })
    it("returns a 200 status if a fighter's successfully updated", done => {

      chai.request(url)
        .put('/api/update/fighters/91')
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'krillinss', displayName: 'Krillinss'})
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(200);
          res.body[0].should.equal(1);
          done();
        })
    })
  })
  describe("Unsuccessful requests", () => {
    it("returns a 400 status if a fighter, displayName, or rosterId aren't sent", done => {

      chai.request(url)
        .put(path)
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({})
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    })
    it("returns a 400 status if a fighter, displayName, or rosterId aren't sent", done => {

      chai.request(url)
        .put(path)
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'gokus', displayName: 'Son Gokus', rosterId: 'not_a_number' })
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    })
    it("returns a 400 status if a fighter, displayName, or rosterId aren't sent", done => {

      chai.request(url)
        .put('/api/update/fighters/999999')
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'test_fighter', displayName: 'test_displayName', rosterId: 12345 })
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(404);
          res.body.should.have.property('error');
          done();
        })
    })
    it("returns a 400 status if a fighter, displayName, or rosterId aren't sent", done => {

      chai.request(url)
        .put(path)
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'krillinss', displayName: 'Krillinss', rosterId: 12345 })
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    })
    // Add a test for trying to update a fighter's key to a value that already exists
  })
})
