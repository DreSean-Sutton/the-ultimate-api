import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
chai.should();
chai.use(chaiHttp);

describe("GET api/get/fighters", () => {
  afterEach(() => {
    sinon.restore();
  })
  const expectedFighterProps = ['fighter', 'fighterId', 'rosterId', 'displayName'];

  describe("base route", () => {

    it("should return a json object containing all fighters' basic data", done => {
      chai.request('http://localhost:5000')
        .get('/api/get/fighters')
        .end((err, res) => {
          res.should.have.status(200);
          res.body.should.be.a('array');
          res.body[0].should.have.all.keys(expectedFighterProps);
          done();
        });
    });

    it("should return an error if url isn't valid", done => {
      chai.request('http://localhost:5000')
        .get('/api/get/fighterssssss')
        .end((err, res) => {
          res.should.have.status(404);
          res.body.should.be.a('object');
          res.body.should.be.empty;
          done();
        });
    });

    it("should return an error if query key isn't valid", done => {
      chai.request('http://localhost:5000')
        .get('/api/get/fighters')
        .query({ invalidKey: 'random_value' })
        .end((err, res) => {
          res.should.have.status(400);
          res.body.should.be.a('object');
          res.body.should.haveOwnProperty('error');
          done();
        });
    });

  })


  describe("fighter queries", () => {

    context("successful requests", () => {

      it("should return a json object containing a fighter's basic data", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({fighter: 'inkling'})
          .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('object');
            res.body.fighter.should.equal('inkling');
            res.body.should.have.all.keys(expectedFighterProps);
            done();
          });
      })
    })

    context("unsuccessful requests", () => {

      it("should return an error if fighter is a number", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ fighter: 10 })
          .end((err, res) => {
            res.body.should.haveOwnProperty('error');
            res.body.should.be.a('object');
            res.should.have.status(400);
            done();
          })
      })

      it("should return an error if fighter doesn't exist", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ fighter: 'I_dont_exist' })
          .end((err, res) => {
            res.body.should.haveOwnProperty('error');
            res.body.should.be.a('object');
            res.should.have.status(404);
            done();
          })
      })
    })
  })

  describe("fighterId queries", () => {

    context("successful requests", () => {

      it("should return a json object containing a fighter's basic data", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ fighterId: 10 })
          .end((err, res) => {
            res.body.should.be.a('object');
            res.should.have.status(200);
            res.body.should.have.all.keys(expectedFighterProps);
            done();
          })
      })
    })

    context('failed requests', () => {

      it("should return an error if fighterId isn't an integer", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ fighterId: 'not a number' })
          .end((err, res) => {
            res.body.should.haveOwnProperty('error');
            res.body.should.be.a('object');
            res.should.have.status(400);
            done();
          })
      })

      it("should return an error if fighterId doesn't exist", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ fighterId: 2147483647 })
          .end((err, res) => {
            res.body.should.haveOwnProperty('error');
            res.body.should.be.a('object');
            res.should.have.status(404);
            done();
          })
      })
    })
  })

  describe("rosterId queries", () => {

    context("successful requests", () => {

      it("should return a json object containing a fighter's basic data", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ rosterId: 10 })
          .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('object');
            res.body.should.have.all.keys(expectedFighterProps);
            done();
          })
      })
    })

    context('failed requests', () => {

      it("should return an error if rosterId isn't an integer", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ rosterId: 'not_a_number' })
          .end((err, res) => {
            res.should.have.status(400);
            res.body.should.be.a('object');
            res.body.should.haveOwnProperty('error');
            done();
          })
      })

      it("should return an error if rosterId doesn't exist", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ rosterId: 2147483647 })
          .end((err, res) => {
            res.should.have.status(404);
            res.body.should.be.a('object');
            res.body.should.haveOwnProperty('error');
            done();
          })
      })
    })
  })

  describe("orderByTestId queries", () => {

    context("successful requests", () => {
      it("should return an json object containing all fighter's basic data", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ orderByRosterId: true })
          .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('array');
            res.body[0].should.have.all.keys(expectedFighterProps);
            done();
          })
      })
    })

    context('failed requests', () => {

      it("should return an error if orderByTestId isn't true", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters')
          .query({ orderByRosterId: 'not_true' })
          .end((err, res) => {
            res.should.have.status(400);
            res.body.should.be.a('object');
            res.body.should.haveOwnProperty('error');
            done();
          })
      })
    })
  })
});

describe("GET api/get/fighters/data", () => {
  const expectedMovesProps = [];
  const expectedThrowsProps = [];
  const expectedMovementsProps = [];
  const expectedStatsProps = [];

  describe("base route", () => {
    it("should return an array of json objects", done => {
      chai.request('http://localhost:5000')
        .get('/api/get/fighters/data')
        .end((err, res) => {
          res.should.have.status(200);
          res.body.should.be.a('array');
          done();
        })
    })
    it("should return an error if url path is invalid", done => {
      chai.request('http://localhost:5000')
        .get('/api/get/fighters/dataaaaaaa')
        .end((err, res) => {
          res.should.have.status(404);
          res.body.should.be.empty;
          res.body.should.be.a('object');
          done();
        })
    })
    it("should return an error if an invalid query is passed", done => {
      chai.request('http://localhost:5000')
        .get('/api/get/fighters/data')
        .query({ invalidKey: 'random_value' })
        .end((err, res) => {
          res.should.have.status(400);
          res.body.should.be.a('object');
          res.body.should.haveOwnProperty('error');
          done();
        });
    });
  })

  describe("fighter queries", () => {

    context("successful queries", () => {
      it("should return a json object containing a fighter's data", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ fighter: 'joker' })
          .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('array');
            res.body[0].fighter.should.equal('joker');
            done();
          })
      })
    })

    context("unsuccessful queries", () => {

      it("should return an error if fighter is a number", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ fighter: 10 })
          .end((err, res) => {
            res.should.have.status(400);
            res.body.should.be.a('object');
            res.body.should.haveOwnProperty('error');
            done();
          })
      })

      it("should return an error if fighter has a number", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ fighter: 'joker10' })
          .end((err, res) => {
            res.should.have.status(400);
            res.body.should.be.a('object');
            res.body.should.haveOwnProperty('error');
            done();
          })
      })

      it("should return an error if fighter is a number", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ fighter: 'not_a_fighter' })
          .end((err, res) => {
            res.should.have.status(404);
            res.body.should.be.a('object');
            res.body.should.haveOwnProperty('error');
            done();
          })
      })
    })
  })

  describe("fighterId queries", () => {

    context("successful queries", () => {

      it("should return a json object containing a fighter's data", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ fighterId: 10 })
          .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('array');
            res.body[0].fighterId.should.equal(10);
            done();
          })
      })
    })

    context("unsuccessful queries", () => {

      it("should return a error if figherId isn't an integer", done => {
        chai.request('http://localhost:5000')
        .get('/api/get/fighters/data')
        .query({ fighterId: "not_a_number" })
        .end((err, res) => {
          res.should.have.status(400);
          res.body.should.be.a('object');
          res.body.should.haveOwnProperty('error');
          done();
        })
      })

      it("should return a error if figherId isn't an integer", done => {
        chai.request('http://localhost:5000')
        .get('/api/get/fighters/data')
          .query({ fighterId: 2147483647 })
        .end((err, res) => {
          res.should.have.status(404);
          res.body.should.be.a('object');
          res.body.should.haveOwnProperty('error');
          done();
        })
      })
    })
  })

  describe("rosterId queries", () => {

    context("successful queries", () => {

      it("should return a json object containing a fighter's data", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ rosterId: 10 })
          .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('array');
            res.body[0].rosterId.should.equal(10);
            done();
          })
      })
    })

    context("unsuccessful queries", () => {

      it("should return a error if rosterId isn't an integer", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ rosterId: "not_a_number" })
          .end((err, res) => {
            console.log(res.body);
            res.should.have.status(400);
            res.body.should.be.a('object');
            res.body.should.haveOwnProperty('error');
            done();
          })
      })

      it("should return a error if rosterId isn't an integer", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ rosterId: 2147483647 })
          .end((err, res) => {
            res.should.have.status(404);
            res.body.should.be.a('object');
            res.body.should.haveOwnProperty('error');
            done();
          })
      })
    })
  })

  describe("orderByRosterId", () => {

    context("successful queries", () => {

      it("should return a json object that's ordered by rosterId when orderByRosterId is true", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ orderByRosterId: true })
          .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('array');
            res.body[0].rosterId.should.equal(1);
            done();
          })
      })
    })

    context("unsuccessful queries", () => {

      it("should return an error if orderByRosterId's value isn't true", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data')
          .query({ orderByRosterId: 'not_true' })
          .end((err, res) => {
            res.should.have.status(400);
            res.body.should.be.a('object');
            res.body.should.haveOwnProperty('error');
            done();
          })
      })
    })
  })
})

describe("GET api/get/fighters/data/:type", () => {

  function renderTypeTests(type: string, status: number, done: any, query?: any) {

    query = query || {}
    chai.request('http://localhost:5000')
      .get(`/api/get/fighters/data/${type}s`)
      .query(query)
      .end((err, res) => {
        if(err) return done(err);
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

      it("should return a json object of all move data", done => {
        renderTypeTests('move', 200, done);
      })
      it("should return a json object of a fighter's move data when fighter is queried", done => {
        renderTypeTests('move', 200, done, { fighter: 'inkling' });
      })
      it("should return a json object of a fighter's move data when fighterId is queried", done => {
        renderTypeTests('move', 200, done, { fighterId: 5 });
      })
      it("should return a json object of a fighter's move data when rosterId is queried", done => {
        renderTypeTests('move', 200, done, { rosterId: 10 });
      })
      it("should return a json object of a all move data ordered by rosterId", done => {
        renderTypeTests('move', 200, done, { orderByRosterId: true });
      })
    })

    context("unsuccessful queries", () => {

      it("should return an error if path doesn't exist", done => {
        renderTypeTests('non_existing_path', 400, done);
      })
      it("should return an error if fighter is a number", done => {
        renderTypeTests('move', 400, done, { fighter: 52 });
      })
      it("should return an error if fighter doesn't exist", done => {
        renderTypeTests('move', 404, done, { fighter: 'i_dont_exist' });
      })
      it("should return an error if fighterId isn't an integer", done => {
        renderTypeTests('move', 400, done, { fighterId: 'not_an_integer' });
      })
      it("should return an error if fighterId doesn't exist", done => {
        renderTypeTests('move', 404, done, { fighterId: 2147483647 });
      })
      it("should return an error if rosterId isn't an integer", done => {
        renderTypeTests('move', 400, done, { rosterId: 'not_an_integer' });
      })
      it("should return an error if rosterId doesn't exist", done => {
        renderTypeTests('move', 404, done, { rosterId: 2147483647 });
      })
      it("should return an error if", done => {
        renderTypeTests('move', 400, done, { orderByRosterId: 'not_valid' });
      })
    })
  })

  describe("throws queries", () => {

    context("successful queries", () => {

      it("should return a json object of all throw data", done => {
        renderTypeTests('throw', 200, done);
      })
      it("should return a json object of a fighter's throw data when fighter is queried", done => {
        renderTypeTests('throw', 200, done, { fighter: 'inkling' });
      })
      it("should return a json object of a fighter's throw data when fighterId is queried", done => {
        renderTypeTests('throw', 200, done, { fighterId: 5 });
      })
      it("should return a json object of a fighter's throw data when rosterId is queried", done => {
        renderTypeTests('throw', 200, done, { rosterId: 10 });
      })
      it("should return a json object of a all throw data ordered by rosterId", done => {
        renderTypeTests('throw', 200, done, { orderByRosterId: true });
      })
    })

    context("unsuccessful queries", () => {

      it("should return an error if path doesn't exist", done => {
        renderTypeTests('non_existing_path', 400, done);
      })
      it("should return an error if fighter is a number", done => {
        renderTypeTests('throw', 400, done, { fighter: 52 });
      })
      it("should return an error if fighter doesn't exist", done => {
        renderTypeTests('throw', 404, done, { fighter: 'i_dont_exist' });
      })
      it("should return an error if fighterId isn't an integer", done => {
        renderTypeTests('throw', 400, done, { fighterId: 'not_an_integer' });
      })
      it("should return an error if fighterId doesn't exist", done => {
        renderTypeTests('throw', 404, done, { fighterId: 2147483647 });
      })
      it("should return an error if rosterId isn't an integer", done => {
        renderTypeTests('throw', 400, done, { rosterId: 'not_an_integer' });
      })
      it("should return an error if rosterId doesn't exist", done => {
        renderTypeTests('throw', 404, done, { rosterId: 2147483647 });
      })
      it("should return an error if", done => {
        renderTypeTests('throw', 400, done, { orderByRosterId: 'not_valid' });
      })
    })
  })

  describe("movements queries", () => {

    context("successful queries", () => {

      it("should return a json object of all movement data", done => {
        renderTypeTests('movement', 200, done);
      })
      it("should return a json object of a fighter's movement data when fighter is queried", done => {
        renderTypeTests('movement', 200, done, { fighter: 'inkling' });
      })
      it("should return a json object of a fighter's movement data when fighterId is queried", done => {
        renderTypeTests('movement', 200, done, { fighterId: 5 });
      })
      it("should return a json object of a fighter's movement data when rosterId is queried", done => {
        renderTypeTests('movement', 200, done, { rosterId: 10 });
      })
      it("should return a json object of a all movement data ordered by rosterId", done => {
        renderTypeTests('movement', 200, done, { orderByRosterId: true });
      })
    })

    context("unsuccessful queries", () => {

      it("should return an error if path doesn't exist", done => {
        renderTypeTests('non_existing_path', 400, done);
      })
      it("should return an error if fighter is a number", done => {
        renderTypeTests('movement', 400, done, { fighter: 52 });
      })
      it("should return an error if fighter doesn't exist", done => {
        renderTypeTests('movement', 404, done, { fighter: 'i_dont_exist' });
      })
      it("should return an error if fighterId isn't an integer", done => {
        renderTypeTests('movement', 400, done, { fighterId: 'not_an_integer' });
      })
      it("should return an error if fighterId doesn't exist", done => {
        renderTypeTests('movement', 404, done, { fighterId: 2147483647 });
      })
      it("should return an error if rosterId isn't an integer", done => {
        renderTypeTests('movement', 400, done, { rosterId: 'not_an_integer' });
      })
      it("should return an error if rosterId doesn't exist", done => {
        renderTypeTests('movement', 404, done, { rosterId: 2147483647 });
      })
      it("should return an error if", done => {
        renderTypeTests('movement', 400, done, { orderByRosterId: 'not_valid' });
      })
    })
  })

  describe("stats queries", () => {

    context("successful queries", () => {

      it("should return a json object of all stat data", done => {
        renderTypeTests('stat', 200, done);
      })
      it("should return a json object of a fighter's stat data when fighter is queried", done => {
        renderTypeTests('stat', 200, done, { fighter: 'inkling' });
      })
      it("should return a json object of a fighter's stat data when fighterId is queried", done => {
        renderTypeTests('stat', 200, done, { fighterId: 5 });
      })
      it("should return a json object of a fighter's stat data when rosterId is queried", done => {
        renderTypeTests('stat', 200, done, { rosterId: 10 });
      })
      it("should return a json object of a all stat data ordered by rosterId", done => {
        renderTypeTests('stat', 200, done, { orderByRosterId: true });
      })
    })

    context("unsuccessful queries", () => {

      it("should return an error if path doesn't exist", done => {
        renderTypeTests('non_existing_path', 400, done);
      })
      it("should return an error if fighter is a number", done => {
        renderTypeTests('stat', 400, done, { fighter: 52 });
      })
      it("should return an error if fighter doesn't exist", done => {
        renderTypeTests('stat', 404, done, { fighter: 'i_dont_exist' });
      })
      it("should return an error if fighterId isn't an integer", done => {
        renderTypeTests('stat', 400, done, { fighterId: 'not_an_integer' });
      })
      it("should return an error if fighterId doesn't exist", done => {
        renderTypeTests('stat', 404, done, { fighterId: 2147483647 });
      })
      it("should return an error if rosterId isn't an integer", done => {
        renderTypeTests('stat', 400, done, { rosterId: 'not_an_integer' });
      })
      it("should return an error if rosterId doesn't exist", done => {
        renderTypeTests('stat', 404, done, { rosterId: 2147483647 });
      })
      it("should return an error if", done => {
        renderTypeTests('stat', 400, done, { orderByRosterId: 'not_valid' });
      })
    })
  })
})
