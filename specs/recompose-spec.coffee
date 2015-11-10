recompose = require('../src/recompose')
expect = require('chai').expect

describe "recompose", ->
  it "should recompose the empty object to 0", ->
    expect(recompose({})).to.eq(0)

  it "recompose a ones column to the value of the column", ->
    expect(recompose({ones: 3})).to.eq(3)

  it "recompose a tens column to the ten times the value of the column", ->
    expect(recompose({tens: 4})).to.eq(40)

  it "recompose a hundreds column to the one hundred times the value of the column", ->
    expect(recompose({hundreds: 5})).to.eq(500)
