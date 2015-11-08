h = require('virtual-dom').h

module.exports = (column, n) ->
  cells = [1..n].map(-> h("tr.#{column}", h('td', column)))
  return h 'td',
    h 'table', cells
