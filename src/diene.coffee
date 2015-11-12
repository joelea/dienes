h = require('virtual-dom').h

row = (n) -> [0...n].map -> h 'td'

module.exports =
  one: ->
    h 'table.one.diene',
      h 'tr', row(1)

  ten: ->
    h 'table.ten.diene',
      h 'tr', row(10)
