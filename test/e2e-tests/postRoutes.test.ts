import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
const dotenv = require('dotenv');
dotenv.config({ path: '.env' });
chai.should();
chai.use(chaiHttp);

const testKey = process.env.TEST_API_KEY || '';

describe("POST /api/add/fighters", () => {
  const url = 'http://localhost:5000';
  const path = '/api/add/fighters';

  describe("successful requests", () => {
    it("returns a 201 status if a fighter successfully inserted", done => {

      const returnedKeys = ['createdAt', 'updatedAt', 'fighterId', 'fighter', 'rosterId', 'displayName'];

      chai.request(url)
        .post(path)
        .set('authorization', testKey)
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

    it("returns a 201 status if a second fighter successfully inserted", done => {

      const returnedKeys = ['createdAt', 'updatedAt', 'fighterId', 'fighter', 'rosterId', 'displayName'];

      chai.request(url)
        .post(path)
        .set('authorization', testKey)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'krillin', displayName: 'Krillin', rosterId: '523' })
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
    it("returns a 400 status if username header is falsy", done => {

      chai.request(url)
        .post(path)
        .set('authorization', testKey)
        .set('content-type', 'application/json')
        .send({ fighter: 'goku', displayName: 'Son Goku', rosterId: '9001' })
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    });
    it("returns a 400 status authorization header is falsy", done => {

      chai.request(url)
        .post(path)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'goku', displayName: 'Son Goku', rosterId: '9001' })
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    });
    it("returns a 401 status if username header is incorrect", done => {

      chai.request(url)
        .post(path)
        .set('authorization', testKey)
        .set('username', 'wrong_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'goku', displayName: 'Son Goku', rosterId: '9001' })
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(401);
          res.body.should.have.property('error');
          done();
        })
    });
    it("returns a 401 status authorization header is incorrect", done => {

      chai.request(url)
        .post(path)
        .set('authorization', 'wrong_apikey')
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'goku', displayName: 'Son Goku', rosterId: '9001' })
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(401);
          res.body.should.have.property('error');
          done();
        })
    });
    it("returns a 400 status if the fighter is already in the database", done => {

      chai.request(url)
        .post(path)
        .set('authorization', testKey)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'goku', displayName: 'Son Goku2', rosterId: '90012' })
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    });
    it("returns a 400 status if the displayName is already in the database", done => {

      chai.request(url)
        .post(path)
        .set('authorization', testKey)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'goku2', displayName: 'Son Goku', rosterId: '90012' })
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    });
    it("returns a 400 status if the rosterId is already in the database", done => {

      chai.request(url)
        .post(path)
        .set('authorization', testKey)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({ fighter: 'goku2', displayName: 'Son Goku2', rosterId: '9001' })
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    });
  })
})
