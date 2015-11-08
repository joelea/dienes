h = require('virtual-dom').h
renderColumn = require('./render-column')

module.exports = (decomposition) ->
  h 'table',
    h 'tr', [
      renderColumn 'hundreds', decomposition.hundreds ? 0
      renderColumn 'tens', decomposition.tens ? 0
      renderColumn 'ones', decomposition.ones ? 0
    ]
