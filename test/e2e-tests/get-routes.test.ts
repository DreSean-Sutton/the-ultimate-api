import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
chai.should();
chai.use(chaiHttp);

describe('GET api/get/fighters', () => {
  afterEach(() => {
    sinon.restore();
  })

  it('should return an array of objects containing all fighter\'s data', done => {
    chai.request('http://localhost:5000')
      .get('/api/get/fighters')
      .end((err, res) => {
        res.should.have.status(200);
        res.body.should.be.a('array');
        done();
      });
  });

  it('should return a single json object containing a fighter\'s data', done => {
    chai.request('http://localhost:5000')
      .get('/api/get/fighters')
      .query({fighter: 'inkling'})
      .end((err, res) => {
        res.should.have.status(200);
        res.body.should.be.a('object');
        res.body.fighter.should.equal('inkling');
        done();
      });
  })

  it('should return an error if fighterId query isn\'t a number', done => {
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

  it('should return an error if fighter query is a number', done => {
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

});
