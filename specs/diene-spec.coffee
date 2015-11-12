diene = require('../src/diene')
expect = require('chai').expect
h = require('virtual-dom').h

describe "diene should", ->
  it "render a one correctly", ->
    expect(diene.one()).to.deep.eq(
      h 'table.one.diene',
        h 'tr',
          h 'td'
    )
