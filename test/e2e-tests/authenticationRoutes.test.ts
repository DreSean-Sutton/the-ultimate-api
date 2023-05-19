import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
chai.should();
chai.use(chaiHttp);

describe("POST /api/auth/register", () => {

  const url = 'http://localhost:5000';
  const path = '/api/auth/register';

  // This is used for resetting database
  function deleteUser() {
    chai.request(url)
      .delete('/api/auth/delete-account')
      .query({})
      .end((err, res) => {
        res.should.have.status(204);
        console.log(res.body);
      })
  }

  describe("successful request", () => {

    const params = {
      email: 'test_email@gmail.com',
      username: 'test_username',
      password: 'test_password'
    }

    it("returns a 201 when user is created", done => {
      const userKeys = ['id', 'email', 'username', 'updatedAt', 'createdAt', 'token', 'tokenExpiration'];
      deleteUser();


      chai.request(url)
        .post(path)
        .set('content-type', 'application/json')
        .send(params)
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
          res.body.should.have.property('errors');
          res.body.should.have.property('fields');
          res.body.fields.should.have.property('email');
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
          res.body.should.have.property('errors');
          res.body.should.have.property('fields');
          res.body.fields.should.have.property('username');
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

describe("POST /api/auth/login", () => {
  const email = 'test_email@gmail.com';
  const password = 'test_password';
  const url = 'http://localhost:5000';
  const path = '/api/auth/login';


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
