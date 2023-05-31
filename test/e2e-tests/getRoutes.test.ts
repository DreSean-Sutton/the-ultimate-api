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
const testToken = `Bearer ${jwt.sign(testPayload, process.env.TOKEN_SECRET)}`;

describe("GET api/get/fighters", () => {

  const expectedFighterProps = ['fighter', 'fighterId', 'rosterId', 'displayName'];
  const url = 'http://localhost:5000';
  const path = '/api/get/fighters';

  function renderFightersTests(status: number, done: any, query?: any, headers?: any, log?: boolean) {
    const authorization = headers?.authorization ? headers.authorization : '';
    const username = headers?.username || '';

    query = query || {}
    chai.request(url)
      .get(path)
      .query(query)
      .set('authorization', authorization)
      .set('username', username)
      .end((err, res) => {
        if (err) return done(err);
        if (log) console.log(res.body);
        res.should.have.status(status);
        if (res.body.hasOwnProperty('error')) {
          res.body.should.be.a('object');
          res.body.should.haveOwnProperty('error');
        } else {
          if(Array.isArray(res.body)) {
            res.body.should.be.a('array');
            res.body[0].should.have.all.keys(expectedFighterProps);
          }
          if (!!query.orderByRosterId) {
            res.body[0].rosterId.should.equal(1);
          } else if (Object.keys(query).length > 0) {
            const queryKey = Object.keys(query)[0];
            res.body[queryKey].should.equal(query[queryKey]);
            res.body.should.have.all.keys(expectedFighterProps);
          }
        }
        done();
      })
  }

  describe("base route", () => {

    context("successful requests", () => {

      it("Returns a json object containing all fighters' basic data", done => {
        renderFightersTests(200, done, {});
      })
      it("Returns a json object containing all of a user's basic fighter data", done => {
        renderFightersTests(200, done, {}, { authorization: testToken, username: 'test_username' }, true);
      })
    })

    context("unsuccessful requests", () => {
      it("Returns an error if url isn't valid", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighterssssss')
          .end((err, res) => {
            res.should.have.status(404);
            res.body.should.be.a('object');
            res.body.should.be.empty;
            done();
          });
      });
      it("Returns an error if query key isn't valid", done => {
        renderFightersTests(400, done, { invalidKey: 'random_value' });
      })
      it("Returns a 400 request if authorization header doesn't have a value", done => {
        renderFightersTests(400, done, {}, { authorization: '', username: 'test_username' });
      })
      it("Returns a 400 request if username header doesn't have a value", done => {
        renderFightersTests(400, done, {}, { authorization: testToken, username: '' });
      })
      it("Returns a 400 request if authorization header doesn't start with 'Bearer '", done => {
        renderFightersTests(400, done, {}, { authorization: testToken.substring(7), username: 'test_username' });
      })
    })
  })


  describe("fighter queries", () => {

    context("successful requests", () => {

      it("Returns a json object containing a fighter's basic data", done => {
        renderFightersTests(200, done, { fighter: 'inkling' });
      })
      it("Returns a json object containing a user's fighter's basic data", done => {
        renderFightersTests(200, done, { fighter: 'goku' }, { authorization: testToken, username: 'test_username' }, true);
      })
    })

    context("unsuccessful requests", () => {

      it("Returns an error if fighter is a number", done => {
        renderFightersTests(400, done, { fighter: 10 });
      })
      it("Returns an error if fighter doesn't exist", done => {
        renderFightersTests(404, done, { fighter: 'i_dont_exist' });
      })
    })
  })

  describe("fighterId queries", () => {

    context("successful requests", () => {

      it("Returns a json object containing a fighter's basic data", done => {
        renderFightersTests(200, done, { fighterId: 10 });
      })
      it("Returns a json object containing a user's fighter's basic data", done => {
        renderFightersTests(200, done, { fighterId: 91 }, { authorization: testToken, username: 'test_username' });
      })
    })

    context('unsuccessful requests', () => {

      it("Returns an error if fighterId isn't an integer", done => {
        renderFightersTests(400, done, { fighterId: 'not a number' });
      })
      it("Returns an error if fighterId doesn't exist", done => {
        renderFightersTests(404, done, { fighterId: 2147483647 });
      })
    })
  })

  describe("rosterId queries", () => {

    context("successful requests", () => {

      it("Returns a json object containing a fighter's basic data", done => {
        renderFightersTests(200, done, { rosterId: 10 });
      })
      it("Returns a json object containing a user's fighter's basic data", done => {
        renderFightersTests(200, done, { rosterId: 9001 }, { authorization: testToken, username: 'test_username' });
      })
    })

    context('unsuccessful requests', () => {

      it("Returns an error if rosterId isn't an integer", done => {
        renderFightersTests(400, done, { rosterId: 'not_a_number' });
      })
      it("Returns an error if rosterId doesn't exist", done => {
        renderFightersTests(404, done, { rosterId: 2147483647 });
      })
    })
  })

  describe("orderByTestId queries", () => {

    context("successful requests", () => {

      it("Returns an json object containing all fighter's basic data", done => {
        renderFightersTests(200, done, { orderByRosterId: true });
      })
      it("Returns a json object containing a user's fighter's basic data", done => {
        renderFightersTests(200, done, { orderByRosterId: true }, { authorization: testToken, username: 'test_username' });
      })
    })

    context('unsuccessful requests', () => {

      it("Returns an error if orderByTestId isn't true", done => {
        renderFightersTests(400, done, { orderByRosterId: 'not_true' });
      })
    })
  })
});

describe("GET api/get/fighters/data", () => {

  function renderDataTests(status: number, done: any, query?: any, headers?: any, log?: boolean) {
    const authorization = headers?.authorization ? headers.authorization : '';
    const username = headers?.username || '';

    query = query || {}
    chai.request('http://localhost:5000')
      .get('/api/get/fighters/data')
      .query(query)
      .set('authorization', authorization)
      .set('username', username)
      .end((err, res) => {
        if (err) return done(err);
        if(log) console.log(res.body);
        res.should.have.status(status);
        if (res.body.hasOwnProperty('error')) {
          res.body.should.be.a('object');
          res.body.should.haveOwnProperty('error');
        } else {
          res.body.should.be.a('array');
          if (!!query.orderByRosterId) {
            res.body[0].rosterId.should.equal(1);
          } else if (Object.keys(query).length > 0) {
            const queryKey = Object.keys(query)[0];
            res.body[0][queryKey].should.equal(query[queryKey]);
          }
        }
        done();
      })
  }

  describe("base route", () => {

    it("Returns a 200 status and array of json objects", done => {
      renderDataTests(200, done, {});
    })
    it("Returns a 200 status and array of a user's json objects", done => {
      renderDataTests(200, done, {}, { authorization: testToken, username: 'test_username' }, true);
    })
    it("Returns an error if url path is invalid", done => {
      chai.request('http://localhost:5000')
        .get('/api/get/fighters/dataaaaaaa')
        .end((err, res) => {
          res.should.have.status(404);
          res.body.should.be.empty;
          res.body.should.be.a('object');
          done();
        })
    })
    it("Returns an error if an invalid query is passed", done => {
      renderDataTests(400, done, { invalidKey: 'random_value' });
    })
  })

  describe("fighter queries", () => {

    context("successful queries", () => {

      it("Returns a 200 status and json object containing a fighter's data", done => {
        renderDataTests(200, done, { fighter: 'joker' });
      })
      it("Returns a 200 status and a user's json object containing a fighter's data", done => {
        renderDataTests(200, done, { fighter: 'goku' }, { authorization: testToken, username: 'test_username' });
    })
    })

    context("unsuccessful queries", () => {

      it("Returns an error if fighter is a number", done => {
        renderDataTests(400, done, { fighter: 10 });
      })
      it("Returns an error if fighter has a number", done => {
        renderDataTests(400, done, { fighter: 'joker10' });
      })
      it("Returns an error if fighter is a number", done => {
        renderDataTests(404, done, { fighter: 'not_a_fighter' });
      })
    })
  })

  describe("fighterId queries", () => {

    context("successful queries", () => {

      it("Returns a json object containing a fighter's data", done => {
        renderDataTests(200, done, { fighterId: 10 });
      })
      it("Returns a json object containing a user's fighter's data", done => {
        renderDataTests(200, done, { fighterId: 90 }, { authorization: testToken, username: 'test_username' });
      })
    })

    context("unsuccessful queries", () => {

      it("Returns a error if fighterId isn't an integer", done => {
        renderDataTests(400, done, { fighterId: 'not_a_number' });
      })

      it("Returns a error if fighterId doesn't exist", done => {
        renderDataTests(404, done, { fighterId: 2147483647 });
      })
    })
  })

  describe("rosterId queries", () => {

    context("successful queries", () => {

      it("Returns a json object containing a fighter's data", done => {
        renderDataTests(200, done, { rosterId: 10 });
      })
      it("Returns a json object containing a user's fighter's data", done => {
        renderDataTests(200, done, { rosterId: 9001 }, { authorization: testToken, username: 'test_username' }, true);
      })
    })

    context("unsuccessful queries", () => {

      it("Returns a error if rosterId isn't an integer", done => {
        renderDataTests(400, done, { rosterId: 'not_a_number' });
      })
      it("Returns a error if rosterId doesn't exist", done => {
        renderDataTests(404, done, { rosterId: 2147483647 });
      })
    })
  })

  describe("orderByRosterId", () => {

    context("successful queries", () => {

      it("Returns a json object that's ordered by rosterId when orderByRosterId is true", done => {
        renderDataTests(200, done, { orderByRosterId: true });
      })
      it("Returns a user's json object that's ordered by rosterId when orderByRosterId is true", done => {
        renderDataTests(200, done, { orderByRosterId: true }, { authorization: testToken, username: 'test_username' }, true);
      })
    })

    context("unsuccessful queries", () => {

      it("Returns an error if orderByRosterId's value isn't true", done => {
        renderDataTests(400, done, { orderByRosterId: 'not_true' });
      })
    })
  })
})

describe("GET api/get/fighters/data/:type", () => {

  function renderTypeTests(type: string, status: number, done: any, query?: any, log?: boolean) {

    query = query || {}
    chai.request('http://localhost:5000')
      .get(`/api/get/fighters/data/${type}s`)
      .query(query)
      .end((err, res) => {
        if(err) return done(err);
        if(log) console.log(res.body);
        res.should.have.status(status);
        if(res.body.hasOwnProperty('error')) {
          res.body.should.be.a('object');
          res.body.should.haveOwnProperty('error');
        } else {
          res.body.should.be.a('array');
          res.body[0].type.should.equal(type);
          if(!!query.orderByRosterId) {
            res.body[0].rosterId.should.equal(1);
          } else if(Object.keys(query).length > 0) {
            const queryKey = Object.keys(query)[0];
            res.body[0][queryKey].should.equal(query[queryKey]);
          }
        }
        done();
      })
  }


  describe("move type", () => {

    context("successful queries", () => {

      it("Returns a json object of all move data", done => {
        renderTypeTests('move', 200, done);
      })
      it("Returns a json object of a fighter's move data when fighter is queried", done => {
        renderTypeTests('move', 200, done, { fighter: 'inkling' });
      })
      it("Returns a json object of a fighter's move data when fighterId is queried", done => {
        renderTypeTests('move', 200, done, { fighterId: 5 });
      })
      it("Returns a json object of a fighter's move data when rosterId is queried", done => {
        renderTypeTests('move', 200, done, { rosterId: 10 });
      })
      it("Returns a json object of a all move data ordered by rosterId", done => {
        renderTypeTests('move', 200, done, { orderByRosterId: true });
      })
    })

    context("unsuccessful queries", () => {

      it("Returns an error if path doesn't exist", done => {
        renderTypeTests('non_existing_path', 400, done);
      })
      it("Returns an error if fighter is a number", done => {
        renderTypeTests('move', 400, done, { fighter: 52 });
      })
      it("Returns an error if fighter doesn't exist", done => {
        renderTypeTests('move', 404, done, { fighter: 'i_dont_exist' });
      })
      it("Returns an error if fighterId isn't an integer", done => {
        renderTypeTests('move', 400, done, { fighterId: 'not_an_integer' });
      })
      it("Returns an error if fighterId doesn't exist", done => {
        renderTypeTests('move', 404, done, { fighterId: 2147483647 });
      })
      it("Returns an error if rosterId isn't an integer", done => {
        renderTypeTests('move', 400, done, { rosterId: 'not_an_integer' });
      })
      it("Returns an error if rosterId doesn't exist", done => {
        renderTypeTests('move', 404, done, { rosterId: 2147483647 });
      })
      it("Returns an error if", done => {
        renderTypeTests('move', 400, done, { orderByRosterId: 'not_valid' });
      })
    })
  })

  describe("throws queries", () => {

    context("successful queries", () => {

      it("Returns a json object of all throw data", done => {
        renderTypeTests('throw', 200, done);
      })
      it("Returns a json object of a fighter's throw data when fighter is queried", done => {
        renderTypeTests('throw', 200, done, { fighter: 'inkling' });
      })
      it("Returns a json object of a fighter's throw data when fighterId is queried", done => {
        renderTypeTests('throw', 200, done, { fighterId: 5 });
      })
      it("Returns a json object of a fighter's throw data when rosterId is queried", done => {
        renderTypeTests('throw', 200, done, { rosterId: 10 });
      })
      it("Returns a json object of a all throw data ordered by rosterId", done => {
        renderTypeTests('throw', 200, done, { orderByRosterId: true });
      })
    })

    context("unsuccessful queries", () => {

      it("Returns an error if path doesn't exist", done => {
        renderTypeTests('non_existing_path', 400, done);
      })
      it("Returns an error if fighter is a number", done => {
        renderTypeTests('throw', 400, done, { fighter: 52 });
      })
      it("Returns an error if fighter doesn't exist", done => {
        renderTypeTests('throw', 404, done, { fighter: 'i_dont_exist' });
      })
      it("Returns an error if fighterId isn't an integer", done => {
        renderTypeTests('throw', 400, done, { fighterId: 'not_an_integer' });
      })
      it("Returns an error if fighterId doesn't exist", done => {
        renderTypeTests('throw', 404, done, { fighterId: 2147483647 });
      })
      it("Returns an error if rosterId isn't an integer", done => {
        renderTypeTests('throw', 400, done, { rosterId: 'not_an_integer' });
      })
      it("Returns an error if rosterId doesn't exist", done => {
        renderTypeTests('throw', 404, done, { rosterId: 2147483647 });
      })
      it("Returns an error if", done => {
        renderTypeTests('throw', 400, done, { orderByRosterId: 'not_valid' });
      })
    })
  })

  describe("movements queries", () => {

    context("successful queries", () => {

      it("Returns a json object of all movement data", done => {
        renderTypeTests('movement', 200, done);
      })
      it("Returns a json object of a fighter's movement data when fighter is queried", done => {
        renderTypeTests('movement', 200, done, { fighter: 'inkling' });
      })
      it("Returns a json object of a fighter's movement data when fighterId is queried", done => {
        renderTypeTests('movement', 200, done, { fighterId: 5 });
      })
      it("Returns a json object of a fighter's movement data when rosterId is queried", done => {
        renderTypeTests('movement', 200, done, { rosterId: 10 });
      })
      it("Returns a json object of a all movement data ordered by rosterId", done => {
        renderTypeTests('movement', 200, done, { orderByRosterId: true });
      })
    })

    context("unsuccessful queries", () => {

      it("Returns an error if path doesn't exist", done => {
        renderTypeTests('non_existing_path', 400, done);
      })
      it("Returns an error if fighter is a number", done => {
        renderTypeTests('movement', 400, done, { fighter: 52 });
      })
      it("Returns an error if fighter doesn't exist", done => {
        renderTypeTests('movement', 404, done, { fighter: 'i_dont_exist' });
      })
      it("Returns an error if fighterId isn't an integer", done => {
        renderTypeTests('movement', 400, done, { fighterId: 'not_an_integer' });
      })
      it("Returns an error if fighterId doesn't exist", done => {
        renderTypeTests('movement', 404, done, { fighterId: 2147483647 });
      })
      it("Returns an error if rosterId isn't an integer", done => {
        renderTypeTests('movement', 400, done, { rosterId: 'not_an_integer' });
      })
      it("Returns an error if rosterId doesn't exist", done => {
        renderTypeTests('movement', 404, done, { rosterId: 2147483647 });
      })
      it("Returns an error if", done => {
        renderTypeTests('movement', 400, done, { orderByRosterId: 'not_valid' });
      })
    })
  })

  describe("stats queries", () => {

    context("successful queries", () => {

      it("Returns a json object of all stat data", done => {
        renderTypeTests('stat', 200, done);
      })
      it("Returns a json object of a fighter's stat data when fighter is queried", done => {
        renderTypeTests('stat', 200, done, { fighter: 'inkling' });
      })
      it("Returns a json object of a fighter's stat data when fighterId is queried", done => {
        renderTypeTests('stat', 200, done, { fighterId: 5 });
      })
      it("Returns a json object of a fighter's stat data when rosterId is queried", done => {
        renderTypeTests('stat', 200, done, { rosterId: 10 });
      })
      it("Returns a json object of a all stat data ordered by rosterId", done => {
        renderTypeTests('stat', 200, done, { orderByRosterId: true });
      })
    })

    context("unsuccessful queries", () => {

      it("Returns an error if path doesn't exist", done => {
        renderTypeTests('non_existing_path', 400, done);
      })
      it("Returns an error if fighter is a number", done => {
        renderTypeTests('stat', 400, done, { fighter: 52 });
      })
      it("Returns an error if fighter doesn't exist", done => {
        renderTypeTests('stat', 404, done, { fighter: 'i_dont_exist' });
      })
      it("Returns an error if fighterId isn't an integer", done => {
        renderTypeTests('stat', 400, done, { fighterId: 'not_an_integer' });
      })
      it("Returns an error if fighterId doesn't exist", done => {
        renderTypeTests('stat', 404, done, { fighterId: 2147483647 });
      })
      it("Returns an error if rosterId isn't an integer", done => {
        renderTypeTests('stat', 400, done, { rosterId: 'not_an_integer' });
      })
      it("Returns an error if rosterId doesn't exist", done => {
        renderTypeTests('stat', 404, done, { rosterId: 2147483647 });
      })
      it("Returns an error if orderByRosterId isn't true", done => {
        renderTypeTests('stat', 400, done, { orderByRosterId: 'not_true' });
      })
    })
  })
})
