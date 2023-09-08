const sqlQueries = require('../../server/utils/sql-queries');

import { expect } from 'chai';

describe.only("Testing sqlQueries's methods", () => {

  describe("getFighters method", () => {

    it('returns a valid sql template literal', () => {
      const result = sqlQueries.getFighters();
      const columnMatches = (/SELECT.*FROM/s).test(result);
      expect(result).to.be.a('string');
      expect(columnMatches).to.be.true;
    })
  })

  describe("getFightersData method", () => {

    it("returns a valid sql template literal with 'moves' argument", () => {
      const result = sqlQueries.getFightersData('moves');
      const columnMatches = (/SELECT.*FROM.*JOIN.*JOIN/s).test(result);
      expect(result).to.be.a('string');
      expect(columnMatches).to.be.true;
    })

    it("returns a valid sql template literal with 'throws' argument", () => {
      const result = sqlQueries.getFightersData('throws');
      const columnMatches = (/SELECT.*FROM.*JOIN.*JOIN/s).test(result);
      expect(result).to.be.a('string');
      expect(columnMatches).to.be.true;
    })

    it("returns a valid sql template literal with 'movements' argument", () => {
      const result = sqlQueries.getFightersData('movements');
      const columnMatches = (/SELECT.*FROM.*JOIN.*JOIN/s).test(result);
      expect(result).to.be.a('string');
      expect(columnMatches).to.be.true;
    })

    it("returns a valid sql template literal with 'stats' argument", () => {
      const result = sqlQueries.getFightersData('stats');
      const columnMatches = (/SELECT.*FROM.*JOIN.*JOIN/s).test(result);
      expect(result).to.be.a('string');
      expect(columnMatches).to.be.true;
    })

    it("returns an error with invalid arguments", () => {
      const result = sqlQueries.getFightersData('fake_argument');
      expect(result).to.haveOwnProperty('error');
      expect(result.error).to.be.a('string');
    })
  })

})
