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

describe.only("POST /api/auth/register", () => {

  const url = 'http://localhost:5000';
  const path = '/api/auth/register';




  describe("successful request", () => {

    const params = {
      email: 'test_email@gmail.com',
      username: 'test_username',
      password: 'test_password'
    }

    it("Resets my tests", done => { // Currently required during testing to make sure this test returns a 201 status
      // This is used for resetting the User schema in the database
      chai.request(url)
        .delete('/api/auth/reset-tests')
        .end((err, res) => {
          console.log(res.body);
          done();
        });
    });
    it("returns a 201 when user is created", done => {
      const userKeys = ['id', 'email', 'username', 'updatedAt', 'createdAt', 'token', 'tokenExpiration'];


      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send(params)
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(201);
          res.body.should.have.property('message');
          res.body.data.should.have.all.key(userKeys);
          done();
        })

    })

    it("returns a 201 when user is created with emptyDB querystring set to true", done => {
      const userKeys = ['id', 'email', 'username', 'updatedAt', 'createdAt', 'token', 'tokenExpiration'];

      const params2 = {
        email: 'other_test_email@gmail.com',
        username: 'other_test_username',
        password: 'other_test_password'
      }

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .query({ emptyDB: true })
        .send(params2)
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(201);
          res.body.should.have.property('message');
          res.body.data.should.have.all.key(userKeys);
          done();
        })

    })
  })

  describe("unsuccessful request", () => {

    const params = {
      email: 'test_email@gmail.com',
      username: 'test_username',
      password: 'test_password'
    }

    it("returns a 400 request if email already exists", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send(params)
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    })
    it("returns a 400 request if username already exists", done => {

      params.email = 'test_email@gmail.com2'; // Changing this value so username is checked for uniqueness

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send(params)
        .end((err, res) => {
          if (err) {
            console.log(err);
            params.email = 'test_email@gmail.com'; // reseting value
            return done(err);
          }
          res.should.have.status(400);
          res.body.should.have.property('error');
          params.email = 'test_email@gmail.com'; // reseting value
          done();
        })
    })
    it("returns a 400 request if email is null", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({
          email: null,
          username: params.username,
          password: params.password
        })
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
    it("returns a 400 request if username is null", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({
          email: params.email,
          username: null,
          password: params.password
        })
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
    it("returns a 400 request if password is null", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({
          email: params.email,
          username: params.username,
          password: null
        })
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
  })
})

describe.only("POST /api/auth/generate-token", () => {
  const email = 'test_email@gmail.com';
  const password = 'test_password';
  const url = 'http://localhost:5000';
  const path = '/api/auth/generate-token';


  describe("successful requests", () => {
    it("returns a 200 status and user token", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({email: email, password: password})
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(200);
          res.body.should.have.property('token');
          done();
        })
    })
    it("returns a 200 status and a different user's token", done => {

      const params2 = {
        email: 'other_test_email@gmail.com',
        password: 'other_test_password'
      }
      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({email: params2.email, password: params2.password})
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(200);
          res.body.should.have.property('token');
          done();
        })
    })
  })

  describe("unsuccessful requests", () => {
    it("returns a 400 request if email isn't valid", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({email: null, password: password})
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    })

    it("returns a 401 status if email isn't in the database", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({email: `${email}_random_string`, password: password})
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(401);
          res.body.should.have.property('error');
          done();
        })
    })

    it("returns a 401 status if password isn't in the database", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({email: email, password: `${password}_random_string`})
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(401);
          res.body.should.have.property('error');
          done();
        })
    })
  })
})

describe.only("POST /api/auth/show-token", () => {
  const email = 'test_email@gmail.com';
  const password = 'test_password';
  const url = 'http://localhost:5000';
  const path = '/api/auth/show-token';

  describe("successful requests", () => {
    it("Returns a user's token and it's expiration date", done => {
      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({ email: email, password: password })
        .end((err, res) => {
          if(err) {
            console.log(err)
            return done(err);
          }
          res.should.have.status(200);
          res.body.should.have.all.keys(['token', 'expirationDate']);
          done();
        })
    })
  })
  describe("unsuccessful requests", () => {
    it("returns a 401 status if password isn't in the database", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({email: email, password: `${password}_random_string`})
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(401);
          res.body.should.have.property('error');
          done();
        })
    })
    it("returns a 400 request if email isn't valid", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({email: null, password: password})
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(400);
          res.body.should.have.property('error');
          done();
        })
    })
    it("returns a 401 status if email isn't in the database", done => {

      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send({email: `${email}_random_string`, password: password})
        .end((err, res) => {
          if (err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(401);
          res.body.should.have.property('error');
          done();
        })
    })
  })
})

describe.only("POST /api/auth/reset-database", () => {
  const url = 'http://localhost:5000';
  const path = '/api/auth/reset-database';

  it("returns a 200 status code on successful user database reset", done => {

    chai.request(url)
      .post(path)
      .set('Content-Type', 'application/json')
      .set('authorization', `Bearer ${testToken}`)
      .set('username', 'other_test_username')
      .end((err, res) => {
        if(err) {
          console.log(err);
          return done(err);
        }
        console.log(res.body);
        res.should.have.status(200);
        res.body.should.have.property('message');
        done();
      })
  });
});

describe.only("Delete /api/auth/delete-user", () => {
  const url = 'http://localhost:5000';
  const path = '/api/auth/delete-account';

  it("returns a 204 status if the user is deleted", done => {
    chai.request(url)
      .delete(path)
      .set('content-type', 'application/json')
      .set('authorization', `Bearer ${testToken}`)
      .set('username', 'other_test_username')
      .end((err, res) => {
        if(err) {
          console.log(err);
          return done(err);
        }
        res.should.have.status(204);
        done();
      });
  });
});
