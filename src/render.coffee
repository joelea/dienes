h = require('virtual-dom').h
renderColumn = require('./render-column')

renderErrors = ({errors}) ->
  errors ?= []
  errorElements = errors.map((error) -> h('li.error', error))
  h '.errors', "Sorry, we could not decompose that value",
    h 'ul', errorElements

renderDecomposition = (decomposition) ->
  h 'table',
    h 'tr', [
      renderColumn 'hundreds', decomposition.hundreds ? 0
      renderColumn 'tens', decomposition.tens ? 0
      renderColumn 'ones', decomposition.ones ? 0
    ]

module.exports = (decomposition) ->
  h '.content', [
    renderDecomposition(decomposition)
  ]
