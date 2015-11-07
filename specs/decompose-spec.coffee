decompose = require('../src/decompose')
expect = require('chai').expect

describe "decompose", ->
  it "not decompose zeroes", ->
    expect(decompose(0)).to.deep.eq({})

  it "sort single digit numbers into just the ones column", ->
    expect(decompose(7)).to.deep.eq(ones: 7)

  it "put multiples of 10 into the tens column", ->
    expect(decompose(60)).to.deep.eq(tens: 6)

  it "split mixed 2 digit numbers into a tens and ones column", ->
    expect(decompose(54)).to.deep.eq(tens: 5, ones: 4)

  it "handle hundreds", ->
    expect(decompose(514)).to.deep.eq(hundreds: 5, tens: 1, ones: 4)
