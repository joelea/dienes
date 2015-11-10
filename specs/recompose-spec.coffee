recompose = require('../src/recompose')
expect = require('chai').expect

describe "recompose", ->
  it "should recompose the empty object to 0", ->
    expect(recompose({})).to.eq(0)
