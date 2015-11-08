require('./styles/app.less')
h = require('virtual-dom').h
renderColumn = require('./render-column')

table = (rows, columns) ->
  [0...columns].map ->
    h 'tr', [0...rows].map ->
      h 'td.diene', ''

hundredsColumn =
  name: 'hundreds'
  cell: h 'table.hundred.diene', table(10, 10)

tensColumn =
  name: 'tens'
  cell: h 'table.ten.diene', table(10, 1)

onesColumn =
  name: 'ones'
  cell: h 'table.one.diene', table(1, 1)

renderDecomposition = (decomposition) ->
  h '.columns', [
    renderColumn hundredsColumn, decomposition.hundreds ? 0
    renderColumn tensColumn, decomposition.tens ? 0
    renderColumn onesColumn, decomposition.ones ? 0
  ]

module.exports = (decomposition) -> renderDecomposition(decomposition)
