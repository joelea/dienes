require('./styles/app.less')
h = require('virtual-dom').h

header = (columnName) ->
  h ".column-header", [
    h "h4", columnName
    h "input\##{columnName}-input", []
  ]

body = (columnName) ->
  h '.column-body#' + columnName + '-anchor'

column = (columnName) ->
  h ".column.column-#{columnName}", [
    header(columnName)
    body(columnName)
  ]

module.exports = ->
  h '.contents', [
    h '.columns', [
      column 'hundreds'
      column 'tens'
      column 'ones'
    ]
  ]
