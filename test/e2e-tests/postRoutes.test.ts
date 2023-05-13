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

describe("POST /api/add/fighters", () => {


  const url = 'http://localhost:5000';
  const path = '/api/add/fighters';

  describe("successful requests", () => {
    it("returns a 201 status if a fighter successfully inserted", done => {

      console.log(testToken);
      const returnedKeys = ['createdAt', 'updatedAt', 'fighterId', 'fighter', 'rosterId', 'displayName'];

      chai.request(url)
        .post(path)
        .set('authorization', `Bearer ${testToken}`)
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
        .set('authorization', `Bearer ${testToken}`)
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
        .set('authorization', `Bearer ${testToken}`)
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
        .set('authorization', `Bearer ${testToken}`)
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
        .set('authorization', `Bearer ${testToken}`)
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
        .set('authorization', `Bearer ${testToken}`)
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
        .set('authorization', `Bearer ${testToken}`)
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

describe("POST /api/add/:table/:id", () => {

  const url = 'http://localhost:5000';

  describe("POST /api/add/moves/:id", () => {
    const path = '/api/add/moves/90';
    const moveProperties = ['activeFrames', 'category', 'createdAt', 'damage', 'fighterId', 'firstFrame', 'moveId', 'moveType', 'name', 'totalFrames', 'type', 'updatedAt'];

    describe("Successful requests", () => {

      it("Returns a 201 status if a move is successfully inserted", done => {
        chai.request(url)
          .post(path)
          .set('authorization', `Bearer ${testToken}`)
          .set('username', 'test_username')
          .set('content-type', 'application/json')
          .send({
            activeFrames: '1-50',
            category: 'special',
            damage: '9000',
            firstFrame: '1',
            moveType: 'single hit',
            name: 'kamehameha',
            totalFrames: '80'
          })
          .end((err, res) => {
            if (err) {
              console.log(err);
              return done(err);
            }
            res.should.have.status(201);
            res.body.should.have.all.keys(moveProperties);
            done();
          })
      })

      it("Returns a 201 status if a second move is successfully inserted", done => {
        chai.request(url)
          .post('/api/add/moves/91')
          .set('authorization', `Bearer ${testToken}`)
          .set('username', 'test_username')
          .set('content-type', 'application/json')
          .send({
            activeFrames: '1',
            category: 'special',
            damage: 'yes',
            firstFrame: '1',
            moveType: 'self damage',
            name: 'instantly die',
            totalFrames: '1',
          })
          .end((err, res) => {
            if (err) {
              console.log(err);
              return done(err);
            }
            res.should.have.status(201);
            res.body.should.have.all.keys(moveProperties);
            done();
          })
      })
    })
    describe("Unsuccessful requests", () => {

    })
  })

  describe("POST /api/add/throws/:id", () => {
    const path = '/api/add/throws/90';
    const throwProperties = ['activeFrames', 'createdAt', 'damage', 'fighterId', 'throwId', 'name', 'totalFrames', 'type', 'updatedAt'];

    describe("Successful requests", () => {
      it("Returns a 201 status if a throw is successfully inserted", done => {
        chai.request(url)
          .post(path)
          .set('authorization', `Bearer ${testToken}`)
          .set('username', 'test_username')
          .set('content-type', 'application/json')
          .send({
            activeFrames: '10-20/33/35/37/39/51',
            damage: '10.0/2.0/2.0/2.0/2.0/5.0%',
            name: 'forward throw',
            totalFrames: '90'
          })
          .end((err, res) => {
            if(err) {
              console.log(err);
              return done(err);
            }
            res.should.have.status(201);
            res.body.should.have.all.keys(throwProperties);
            done();
          })
      })
    })
    it("Returns a 201 status if a second fighter's throw is successfully inserted", done => {
      chai.request(url)
        .post('/api/add/throws/91')
        .set('authorization', `Bearer ${testToken}`)
        .set('username', 'test_username')
        .set('content-type', 'application/json')
        .send({
          activeFrames: '30',
          damage: '8.0%',
          name: 'down throw',
          totalFrames: '40'
        })
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(201);
          res.body.should.have.all.keys(throwProperties);
          done();
        })
    })

  })
})
