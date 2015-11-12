h = require('virtual-dom').h

module.exports =
  one: ->
    h 'table.one.diene',
      h 'tr', [
        h 'td'
      ]

  ten: ->
    h 'table.ten.diene',
      h 'tr', [
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
      ]
