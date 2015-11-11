safeParseInt = require('../src/safe-parse-int')
expect = require('chai').expect

describe "safeParseInt should", ->
  it 'parses a number to itself', ->
    expect(safeParseInt(3)).to.eq(3)

  it 'parses undefined to 0', ->
    expect(safeParseInt(undefined)).to.eq(0)

  it 'parses empty string to 0', ->
    expect(safeParseInt("")).to.eq(0)

  it 'parses string numbers as numbers', ->
    expect(safeParseInt("3")).to.eq(3)
