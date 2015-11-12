require('./styles/app.less')
h = require('virtual-dom').h
renderColumn = require('./render-column')

header = (columnName) ->
  h ".column-header", [
    h "h4", columnName
    h "input\##{columnName}-input", []
  ]

body = (columnName) ->
  h '.column-body',
    h '#' + columnName + '-anchor'

column = (columnName) ->
  h ".column.column-#{columnName}", [
    header(columnName)
    body(columnName)
  ]

module.exports = ->
  h '.columns', [
    column 'hundreds'
    column 'tens'
    column 'ones'
  ]
