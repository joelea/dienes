h = require('virtual-dom').h
renderColumn = require('./render-column')

renderInvalidDecomposition = (initialValue) ->
  h '.error', "Sorry, we cannot decompose #{initialValue}"

renderValidDecomposition = (decomposition) ->
  h 'table',
    h 'tr', [
      renderColumn 'hundreds', decomposition.hundreds ? 0
      renderColumn 'tens', decomposition.tens ? 0
      renderColumn 'ones', decomposition.ones ? 0
    ]

render = ([decomposition, initialValue]) ->
  return if decomposition.error
    renderInvalidDecomposition(initialValue)
  else
    renderValidDecomposition(decomposition)

module.exports = renderValidDecomposition
