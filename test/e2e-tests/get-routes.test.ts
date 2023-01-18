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
  function renderSuccessfulTests(type: string, status: number, done: any, query?: any) {
    const queryKey = Object.keys(query)[0];
    return chai.request('http://localhost:5000')
      .get(`/api/get/fighters/data/${type}s`)
      .query(query)
      .end((err, res) => {
        if(err) return done(err);
        res.should.have.status(status);
        if(!!res.body.error) {
          res.body.should.be.a('object');
          res.body.should.haveOwnProperty('error');
        } else {
          res.body.should.be.a('array');
          res.body[0].type.should.equal(type);
          if(queryKey) {
            res.body[0][queryKey].should.equal(query[queryKey]);
          }
        }
        done();
      })
  }


  describe.only("move type", () => {

    context("successful queries", () => {

      it("should return a json object of all move data", done => {
        renderSuccessfulTests('move', 200, done, { fighter: 'inkling' });
      })

      it("should return a json object of a fighter's move data when queried by fighter", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data/moves')
          .query({ fighter: 'pyra' })
          .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('array');
            res.body[0].fighter.should.equal('pyra');
            done();
          })
      })
      it("should return a json object of a fighter's move data when queried by fighterId", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data/moves')
          .query({ fighterId: 1 })
          .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('array');
            res.body[0].fighterId.should.equal(1);
            done();
          })
      })
      it("should return a json object of a fighter's move data when queried by rosterId", done => {
        chai.request('http://localhost:5000')
          .get('/api/get/fighters/data/moves')
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

      it("should return an error if path doesn't exist")
    })
  })

  describe("throws queries", () => {

    context("successful queries", () => {

    })

    context("unsuccessful queries", () => {

    })
  })

  describe("movements queries", () => {

    context("successful queries", () => {

    })

    context("unsuccessful queries", () => {

    })
  })

  describe("stats queries", () => {

    context("successful queries", () => {

    })

    context("unsuccessful queries", () => {

    })
  })
})
