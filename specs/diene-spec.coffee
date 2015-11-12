diene = require('../src/diene')
expect = require('chai').expect
h = require('virtual-dom').h
_ = require('lodash')

describe "diene should", ->
  it "render a one correctly", ->
    expect(diene.one()).to.deep.eq(
      h 'table.one.diene',
        h 'tr', [h 'td']
    )

  it "render a ten correctly", ->
    expect(diene.ten()).to.deep.eq(
      h 'table.ten.diene', _.range(10).map( -> h 'tr', h 'td')
    )

  it "render a hundred correctly", ->
    expect(diene.hundred()).to.deep.eq(
      h 'table.hundred.diene', _.range(10).map ->
        h 'tr', _.range(10).map ->
          h 'td'
    )
