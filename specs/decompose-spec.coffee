decompose = require('../src/decompose')
expect = require('chai').expect

describe "decompose", ->
  it "should not decompose zeroes", ->
    expect(decompose(0)).to.deep.eq({})

  it "sort single digit numbers into just the ones column", ->
    expect(decompose(7)).to.deep.eq(ones: 7)
