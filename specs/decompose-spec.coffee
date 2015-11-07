decompose = require('../src/decompose')
expect = require('chai').expect

describe "decompose", ->
  it "should not decompose zeroes", ->
    expect(decompose(0)).to.deep.eq({})