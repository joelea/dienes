h = require('virtual-dom').h

header = (column) ->
  h ".column-header", [
    h "h4", column.name
    h "input\##{column.name}-input", []
  ]
module.exports = (column, n) ->
  cells = [0...n].map -> column.cell
  return h ".column.column-#{column.name}", [
      header(column)
      h(".column-body", cells)
    ]
