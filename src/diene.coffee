h = require('virtual-dom').h
_ = require('lodash')

row = (n) -> _.range(n).map -> h 'td'

module.exports =
  one: ->
    h 'table.one.diene',
      h 'tr', row(1)

  ten: ->
    h 'table.ten.diene',
      h 'tr', row(10)

  hundred: ->
    h 'table.hundred.diene', _.range(10).map ->
      h 'tr', row(10)
