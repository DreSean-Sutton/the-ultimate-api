import { assert, expect } from 'chai';

describe('add', () => {
  function add(num1: number, num2: number): number {
    return num1 + num2;
  }

  it('should add two numbers', () => {
    expect(add(2, 3)).to.equal(5);
    const result = add(5, 3);
    assert.equal(result, 8);
  });
});
