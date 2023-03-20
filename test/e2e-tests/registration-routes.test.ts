import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
chai.should();
chai.use(chaiHttp);

describe.only("POST /api/registration/sign-up", () => {

  const params = {
    email: 'test_email',
    username: 'test_username',
    password: 'test_password'
  }

  // This is used for resetting database
  function deleteUser() {
    chai.request('http://localhost:5000')
      .delete('/api/registration/delete-account')
      .query({})
      .end((err, res) => {
        res.should.have.status(204);
        console.log(res.body);
      })
  }

  describe("successful request", () => {



    it("returns a 201 when user is created", done => {
      deleteUser();
      const userKeys = ['id', 'email', 'username', 'password', 'updatedAt', 'createdAt'];

      chai.request('http://localhost:5000')
        .post('/api/registration/sign-up')
        .set('content-type', 'application/json')
        .send(params)
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          console.log(res.body);
          res.should.have.status(201);
          res.body.should.have.all.key(userKeys);
          done();
        })

    })
  })
  describe("unsuccessful request", () => {
    it("returns a 400 request if email already exists", done => {

      chai.request('http://localhost:5000')
        .post('/api/registration/sign-up')
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
  })
})
