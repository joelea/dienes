h = require('virtual-dom').h
_ = require('lodash')

rowContents = (n) -> _.range(n).map -> h 'td'
rows = (n, contents) -> _.range(n).map -> h 'tr', contents

module.exports =
  one: ->
    h 'table.one.diene', rows(1, rowContents(1))

  ten: ->
    h 'table.ten.diene', rows(10, rowContents(1))

  hundred: ->
    h 'table.hundred.diene', rows(10, rowContents(10))
