import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
chai.should();
chai.use(chaiHttp);

describe("POST /api/registration/sign-up", () => {

  // This is used for resetting database
  function deleteUser(done: any) {
    chai.request('http://localhost:5000')
      .delete('/api/registration/delete-account')
      .query({})
      .end((err, res) => {
        if(err) return done(err);
        res.should.have.status(204);
        console.log(res.body);
        done();
      })
  }

  describe("successful request", () => {

    it("returns a 201 when user is created", done => {
      deleteUser(done);
      const userKeys = ['id', 'email', 'username', 'password', 'updatedAt', 'createdAt'];

      chai.request('http://localhost:5000')
        .post('/api/registration/sign-up')
        .query({})
        .end((err, res) => {
          if(err) return done(err);
          res.should.have.status(201);
          res.body.should.have.all.key(userKeys);
          console.log(res.body);
          done(err);
        })

    })
  })
  describe("unsuccessful request", () => {

  })
})
