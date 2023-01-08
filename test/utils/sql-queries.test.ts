const sqlQueries = require('../../server/utils/sql-queries');

import { expect } from 'chai';

describe("Testing sqlQueries's methods", () => {
  describe('getFighters method', () => {
    it('returns a sql template literal', () => {
      const result = sqlQueries.getFighters();
      expect(result).to.be.a('string');
    })
  })

  describe('getFightersData', () => {
    it("returns sql template literal with 'moves' argument", () => {
      const result = sqlQueries.getFightersData('moves');
      expect(result).to.be.a('string');
    })

    it("returns sql template literal with 'throws' argument", () => {
      const result = sqlQueries.getFightersData('throws');
      expect(result).to.be.a('string');
    })

    it("returns sql template literal with 'movements' argument", () => {
      const result = sqlQueries.getFightersData('movements');
      expect(result).to.be.a('string');
    })

    it("returns sql template literal with 'stats' argument", () => {
      const result = sqlQueries.getFightersData('stats');
      expect(result).to.be.a('string');
    })

    it("returns an error with invalid arguments", () => {
      const result = sqlQueries.getFightersData('what');
      expect(result).to.haveOwnProperty('error');
      expect(result.error).to.be.a('string');
    })
  })

})
