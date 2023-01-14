import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
chai.should();
chai.use(chaiHttp);

describe('GET api/get/fighters', () => {
  afterEach(() => {
    sinon.restore();
  })
  const expectedFighterProps = ['fighter', 'fighterId', 'rosterId', 'displayName'];

  describe('base route', () => {

    it('should return an array of objects containing all fighter\'s basic data', done => {
      chai.request('http://localhost:5000')
        .get('/api/get/fighters')
        .end((err, res) => {
          res.should.have.status(200);
          res.body.should.be.a('array');
          res.body[0].should.have.all.keys(expectedFighterProps);
          done();
        });
    });

    it('should return an error if url isn\'t valid', done => {
      chai.request('http://localhost:5000')
        .get('/api/get/fighterssssss')
        .end((err, res) => {
          res.should.have.status(404);
          res.body.should.be.a('object');
          res.body.should.be.empty;
          done();
        });
    });

  })


  describe('fighter queries', () => {

    context('successful requests', () => {

      it('should return a single json object containing a fighter\'s basic data', done => {
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

    context('unsuccessful requests', () => {

      it('should return an error if fighter is a number', done => {
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

      it('should return an error if fighter doesn\'t exist', done => {
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

  describe('fighterId queries', () => {

    context('successful queries', () => {

      it('should return a json object containing a fighter\'s basic data', done => {
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

    context('unsuccessful queries', () => {

      it('should return an error if fighterId isn\'t an integer', done => {
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

      it('should return an error if fighterId doesn\'t exist', done => {
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

  describe('rosterId queries', () => {

    context('successful queries', () => {

      it('should return a json object containing a fighter\'s basic data', done => {
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

    context('unsuccessful queries', () => {

      it('should return an error if rosterId isn\'t an integer', done => {
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

      it('should return an error if rosterId doesn\'t exist', done => {
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



});
