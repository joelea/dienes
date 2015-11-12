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

  it "render a ten correctly", ->
    expect(diene.ten()).to.deep.eq(
      h 'table.ten.diene',
        h 'tr',
          h 'td'
          h 'td'
          h 'td'
          h 'td'
          h 'td'
          h 'td'
          h 'td'
          h 'td'
          h 'td'
          h 'td'
    )
