import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
const jwt = require('jsonwebtoken');
chai.should();
chai.use(chaiHttp);
require('dotenv').config();

const baseUrl = process.env.APP_BASE_URL || 'localhost:5000';

const url = baseUrl;
const testPayload = {
  userId: 123,
  exp: Math.floor(Date.now() / 1000) + (60 * 30)
};
const testToken = jwt.sign(testPayload, process.env.TOKEN_SECRET);

describe.only("DELETE 'api/delete/moves/:id", () => {

  describe("Successful requests", () => {

    it("returns a 204 request when a fighter's moves are deleted", done => {
      chai.request(url)
        .delete('/api/delete/moves/2099')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(204);
          done();
        })
    })
  })

  describe("Unsuccessful Requests", () => {

    it("returns a 404 request when a fighter's moves aren't found", done => {
      chai.request(url)
        .delete('/api/delete/moves/999999')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(404);
          res.body.should.have.property('error');
          done();
        })
    })
  })
})

describe.only("DELETE 'api/delete/throws/:id", () => {

  describe("Successful requests", () => {

    it("returns a 204 request when a fighter's throws are deleted", done => {
      chai.request(url)
        .delete('/api/delete/throws/718')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
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

  describe("Unsuccessful Requests", () => {

    it("returns a 404 request when a fighter's throws aren't found", done => {
      chai.request(url)
        .delete('/api/delete/throws/999999')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(404);
          res.body.should.have.property('error');
          done();
        });
    });
  });
});

describe.only("DELETE 'api/delete/movements/:id", () => {

  describe("Successful requests", () => {

    it("returns a 204 request when a fighter's movements are deleted", done => {
      chai.request(url)
        .delete('/api/delete/movements/804')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
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

  describe("Unsuccessful requests", () => {

    it("returns a 404 request when a fighter's movements aren't found", done => {
      chai.request(url)
        .delete('/api/delete/movements/999999')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(404);
          res.body.should.have.property('error');
          done();
        })
    });
  });
});

describe.only("DELETE 'api/delete/stats/:id", () => {

  describe("Successful requests", () => {

    it("returns a 204 request when a fighter's stats are deleted", done => {
      chai.request(url)
        .delete('/api/delete/stats/1164')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
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

  describe("Unsuccessful requests", () => {

    it("returns a 404 request when a fighter's stats aren't found", done => {
      chai.request(url)
        .delete('/api/delete/stats/999999')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(404);
          res.body.should.have.property('error');
          done();
        })
    });
  });
});

describe.only("DELETE /api/delete/fighters/:id", () => {

  describe("Successful Requests", () => {

    it("returns a 204 request when a fighter is deleted", done => {
      chai.request(url)
        .delete('/api/delete/fighters/90')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(204);
          done();
        })
    })
  })

  describe("Unsuccessful Requests", () => {

    it("returns a 404 request when a fighter isn't found", done => {
      chai.request(url)
        .delete('/api/delete/fighters/90000')
        .set('Authorization', `Bearer ${testToken}`)
        .set('Username', 'test_username')
        .set('Content-Type', 'application/json')
        .end((err, res) => {
          if(err) {
            console.log(err);
            return done(err);
          }
          res.should.have.status(404);
          res.body.should.have.property('error')
          done();
        })
    })
    it("returns an error if the id is not a number", done => {
    chai.request(url)
      .delete('/api/delete/fighters/not_a_number')
      .set('Authorization', `Bearer ${testToken}`)
      .set('Username', 'test_username')
      .set('Content-Type', 'application/json')
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
});
