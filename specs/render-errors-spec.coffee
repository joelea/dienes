h = require('virtual-dom').h
renderErrors = require('../src/render-errors')
expect = require('chai').expect

describe 'renderErrors', ->
  it 'should just render no errors when there are none', ->
    expect(renderErrors([])).to.deep.eq(h '.no-errors', [])

  it 'should just render no errors when the errors are undefined', ->
    expect(renderErrors([])).to.deep.eq(h '.no-errors', [])
