import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
chai.should();
chai.use(chaiHttp);

describe("POST /api/registration/sign-up", () => {

  describe.only("successful request", () => {

    it("returns a 201 when user is created", done => {
      chai.request('http://localhost:5000')
        .post('/api/registration/sign-up')
        .query({})
        .end((err, res) => {
          if(err) return done(err);
          res.should.have.status(201);
          res.body.should.haveOwnProperty('message');
          console.log(res.body);
          done(err);
        })

    })
  })
  describe("unsuccessful request", () => {

  })
})
