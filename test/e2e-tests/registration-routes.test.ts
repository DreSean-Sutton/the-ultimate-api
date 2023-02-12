import chai from 'chai';
import sinon from 'sinon';
import chaiHttp from 'chai-http';
chai.should();
chai.use(chaiHttp);

describe.only("POST /api/registration/sign-up", () => {

  describe("successful request", () => {
    it("returns a 201 and a users API_KEY", async () => {

    })
  })
  describe("unsuccessful request", () => {

  })
})
