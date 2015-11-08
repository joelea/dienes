h = require('virtual-dom').h

module.exports = (column, n) ->
  cells = [0...n].map -> column.cell
  return h ".column.column-#{column.name}", [
      h(".column-header", column.name)
      h(".column-body", cells)
    ]
